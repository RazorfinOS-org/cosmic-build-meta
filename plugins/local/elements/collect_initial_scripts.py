"""
collect_initial_scripts element plugin.

Vendored verbatim from freedesktop-sdk
(plugins/elements/collect_initial_scripts.py, MIT-licensed,
Copyright (c) 2017 freedesktop-sdk).

Walks the dependency graph, collects each element's
`public.initial-script.script` block, and writes them as numbered
executable files under `config.path`. `prepare-image.sh --initscripts`
then runs them against the staged sysroot at image-assembly time.

Required for correct first-deploy permissions (sticky bit on /tmp,
/var/tmp; mode 700 on /root) and for any FDSDK component that ships an
initial-script. Without this plugin, those fixups don't run and the
resulting OCI image has subtly broken permissions.

BuildStream does not save file permissions, and ownership.
include/excludes with integration commands is so complex that only
the "compose" plugin does it correctly.

Because "compose" does not save file permissions and loses integration
commands (because they are executed), that means we need to save file
permissions another way.

This is where collect_initial_scripts works around the issue. It provides a
way to have integration scripts that we execute when we pack into an image
(filesystem, tar, ostree, etc.)
"""

import os
import re

from buildstream import Element


class ExtractInitialScriptsElement(Element):
    BST_MIN_VERSION = "2.0"
    BST_FORBID_RDEPENDS = True
    BST_FORBID_SOURCES = True

    def configure(self, node):
        node.validate_keys(["path"])

        self.path = node.get_str("path")

    def preflight(self):
        pass

    def get_unique_key(self):
        return {"path": self.path}

    def configure_sandbox(self, sandbox):
        pass

    def stage(self, sandbox):
        pass

    def assemble(self, sandbox):
        basedir = sandbox.get_virtual_directory()
        relative_path = self.path.strip(os.sep)

        index = 0
        for dependency in self.dependencies():
            public = dependency.get_public_data("initial-script")
            if public and "script" in public:
                script = public.get_str("script")
                index += 1
                depname = re.sub("[^A-Za-z0-9]", "_", dependency.name)
                basename = f"{index:03}-{depname}"

                pathdir = basedir.open_directory(relative_path, create=True)
                with pathdir.open_file(basename, mode="w") as f:
                    f.write(script)
                    os.chmod(f.fileno(), 0o755)

        return os.sep


def setup():
    return ExtractInitialScriptsElement
