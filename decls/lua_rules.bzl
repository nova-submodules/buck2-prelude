# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under both the MIT license found in the
# LICENSE-MIT file in the root directory of this source tree and the Apache
# License, Version 2.0 found in the LICENSE-APACHE file in the root directory
# of this source tree.

# TODO(cjhopman): This was generated by scripts/hacks/rules_shim_with_docs.py,
# but should be manually editted going forward. There may be some errors in
# the generated docs, and so those should be verified to be accurate and
# well-formatted (and then delete this TODO)

load(":common.bzl", "CxxRuntimeType", "CxxSourceType", "HeadersAsRawHeadersMode", "prelude_rule")
load(":cxx_common.bzl", "cxx_common")
load(":lua_common.bzl", "lua_common")

LuaPlatformPackageStyle = ["standalone", "inplace"]

cxx_lua_extension = prelude_rule(
    name = "cxx_lua_extension",
    docs = """
        A cxx\\_lua\\_extension() rule is a variant of a C/C++ library which is built as a Lua module. As such,
        it has a module name formed by the `base_module` parameter and the rule name and implictly
        depends on Lua C library (configured via the `.buckconfig`
        parameter.
    """,
    examples = """
        ```

        # A rule that builds a Lua extension from a single .cpp file.
        cxx_lua_extension(
          name = 'mymodule',
          base_module = 'foo.bar',
          srcs = [
            'mymodule.cpp',
          ],
          compiler_flags = [
            '-fno-omit-frame-pointer',
          ],
        )

        # A library rule which has a single source importing the above extension.
        lua_library(
          name = 'utils',
          srcs = [
            'utils.lua',
          ],
          deps = [
            ':mymodule',
          ],
        )

        ```

        ```

        -- The `utils.lua` source, wrapped by the `utils` rule above.

        -- Import the C/C++ extension build above.
        require "foo.bar.mymodule"

        ...

        ```
    """,
    further = None,
    attrs = (
        # @unsorted-dict-items
        lua_common.base_module_arg() |
        cxx_common.srcs_arg() |
        cxx_common.platform_srcs_arg() |
        cxx_common.headers_arg() |
        cxx_common.platform_headers_arg() |
        cxx_common.header_namespace_arg() |
        cxx_common.preprocessor_flags_arg() |
        cxx_common.platform_preprocessor_flags_arg() |
        cxx_common.compiler_flags_arg() |
        cxx_common.platform_compiler_flags_arg() |
        cxx_common.linker_flags_arg() |
        cxx_common.platform_linker_flags_arg() |
        {
            "contacts": attrs.list(attrs.string(), default = []),
            "cxx_runtime_type": attrs.option(attrs.enum(CxxRuntimeType), default = None),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "default_platform": attrs.option(attrs.string(), default = None),
            "defaults": attrs.dict(key = attrs.string(), value = attrs.string(), sorted = False, default = {}),
            "deps": attrs.list(attrs.dep(), default = []),
            "executable_name": attrs.option(attrs.string(), default = None),
            "frameworks": attrs.list(attrs.string(), default = []),
            "headers_as_raw_headers_mode": attrs.option(attrs.enum(HeadersAsRawHeadersMode), default = None),
            "include_directories": attrs.set(attrs.string(), sorted = True, default = []),
            "labels": attrs.list(attrs.string(), default = []),
            "lang_compiler_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.arg()), sorted = False, default = {}),
            "lang_platform_compiler_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg()))), sorted = False, default = {}),
            "lang_platform_preprocessor_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg()))), sorted = False, default = {}),
            "lang_preprocessor_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.arg()), sorted = False, default = {}),
            "libraries": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "linker_extra_outputs": attrs.list(attrs.string(), default = []),
            "platform_deps": attrs.list(attrs.tuple(attrs.regex(), attrs.set(attrs.dep(), sorted = True)), default = []),
            "post_linker_flags": attrs.list(attrs.arg(), default = []),
            "post_platform_linker_flags": attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg())), default = []),
            "precompiled_header": attrs.option(attrs.source(), default = None),
            "prefix_header": attrs.option(attrs.source(), default = None),
            "raw_headers": attrs.set(attrs.source(), sorted = True, default = []),
            "version_universe": attrs.option(attrs.string(), default = None),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

lua_binary = prelude_rule(
    name = "lua_binary",
    docs = """
        A `lua_library()` rule is used to group together Lua sources
        to be packaged into a top-level `lua\\_binary()`rule.
    """,
    examples = """
        ```

        lua_binary(
          name = 'tailer',
          main_module = 'tailer',
          deps = [
            ':tailerutils',
          ],
        )

        lua_library(
          name = 'tailerutils',
          srcs = glob(['*.lua']),
        )

        ```
    """,
    further = None,
    attrs = (
        # @unsorted-dict-items
        {
            "main_module": attrs.string(default = "", doc = """
                The module which serves as the entry point for this rule.
            """),
            "deps": attrs.list(attrs.dep(), default = [], doc = """
                `lua\\_library()`rules to this binary will access.
            """),
            "contacts": attrs.list(attrs.string(), default = []),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "native_starter_library": attrs.option(attrs.dep(), default = None),
            "package_style": attrs.option(attrs.enum(LuaPlatformPackageStyle), default = None),
            "platform": attrs.option(attrs.string(), default = None),
            "platform_deps": attrs.list(attrs.tuple(attrs.regex(), attrs.set(attrs.dep(), sorted = True)), default = []),
            "python_platform": attrs.option(attrs.string(), default = None),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

lua_library = prelude_rule(
    name = "lua_library",
    docs = """
        A `lua_library()` rule is used to group together Lua sources
        to be packaged into a top-level `lua\\_binary()`rule.
    """,
    examples = """
        ```

        # A rule that includes a single .py file.
        lua_library(
          name = 'fileutil',
          srcs = ['fileutil.lua'],
        )

        # A rule that uses glob() to include all sources in the directory which the
        # rule is defined.  It also lists a resource file that gets packaged with
        # the sources in this rule.
        lua_library(
          name = 'testutil',
          srcs = glob(['testutil/**/*.lua'],
        )

        ```
    """,
    further = None,
    attrs = (
        # @unsorted-dict-items
        lua_common.srcs_arg() |
        lua_common.base_module_arg() |
        {
            "deps": attrs.list(attrs.dep(), default = [], doc = """
                Other `lua_library()` rules which list `srcs` from
                 which this rule imports modules.
            """),
            "contacts": attrs.list(attrs.string(), default = []),
            "default_host_platform": attrs.option(attrs.configuration_label(), default = None),
            "labels": attrs.list(attrs.string(), default = []),
            "licenses": attrs.list(attrs.source(), default = []),
            "platform_deps": attrs.list(attrs.tuple(attrs.regex(), attrs.set(attrs.dep(), sorted = True)), default = []),
            "within_view": attrs.option(attrs.option(attrs.list(attrs.string())), default = None),
        }
    ),
)

lua_rules = struct(
    cxx_lua_extension = cxx_lua_extension,
    lua_binary = lua_binary,
    lua_library = lua_library,
)
