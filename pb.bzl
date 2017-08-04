def proto_repositories():
    _proto_repository()
    _well_known_protos_repository()

def _proto_repository():
    native.http_archive(
        name = "com_google_protobuf",
        urls = ["https://github.com/google/protobuf/archive/v3.3.0.tar.gz"],
        sha256 = "94c414775f275d876e5e0e4a276527d155ab2d0da45eed6b7734301c330be36e",
        type = "tar.gz",
        strip_prefix =  "protobuf-3.3.0",
    )

def _well_known_protos_repository():
    """Define a repository with the well-known protos."""
    WELL_KNOWN_PROTOS = [
        "google/protobuf/any.proto",
        "google/protobuf/api.proto",
        "google/protobuf/compiler/plugin.proto",
        "google/protobuf/descriptor.proto",
        "google/protobuf/duration.proto",
        "google/protobuf/empty.proto",
        "google/protobuf/field_mask.proto",
        "google/protobuf/source_context.proto",
        "google/protobuf/struct.proto",
        "google/protobuf/timestamp.proto",
        "google/protobuf/type.proto",
        "google/protobuf/wrappers.proto",
    ]

    native.new_http_archive(
        name = "com_google_protobuf_well_known_protos",
        urls = ["https://github.com/google/protobuf/archive/v3.3.0.tar.gz"],
        sha256 = "94c414775f275d876e5e0e4a276527d155ab2d0da45eed6b7734301c330be36e",
        type = "tar.gz",
        # The well-known protos are below `src` but for protobuf imports to
        # work correctly they should be at the root, so we strip `src`.
        strip_prefix =  "protobuf-3.3.0/src",
        build_file_content = """
proto_library(
    name = "protos",
    srcs = %s,
    visibility = ["//visibility:public"],
)""" % (WELL_KNOWN_PROTOS,),
    )
