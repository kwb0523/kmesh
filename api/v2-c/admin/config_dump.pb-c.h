/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: api/admin/config_dump.proto */

#ifndef PROTOBUF_C_api_2fadmin_2fconfig_5fdump_2eproto__INCLUDED
#define PROTOBUF_C_api_2fadmin_2fconfig_5fdump_2eproto__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1003000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1004001 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif

#include "listener/listener.pb-c.h"
#include "route/route.pb-c.h"
#include "cluster/cluster.pb-c.h"

typedef struct Admin__ConfigDump Admin__ConfigDump;
typedef struct Admin__ConfigResources Admin__ConfigResources;


/* --- enums --- */


/* --- messages --- */

struct  Admin__ConfigDump
{
  ProtobufCMessage base;
  Admin__ConfigResources *static_resources;
  Admin__ConfigResources *dynamic_resources;
};
#define ADMIN__CONFIG_DUMP__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&admin__config_dump__descriptor) \
    , NULL, NULL }


struct  Admin__ConfigResources
{
  ProtobufCMessage base;
  char *version_info;
  size_t n_listener_configs;
  Listener__Listener **listener_configs;
  size_t n_route_configs;
  Route__RouteConfiguration **route_configs;
  size_t n_cluster_configs;
  Cluster__Cluster **cluster_configs;
};
#define ADMIN__CONFIG_RESOURCES__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&admin__config_resources__descriptor) \
    , (char *)protobuf_c_empty_string, 0,NULL, 0,NULL, 0,NULL }


/* Admin__ConfigDump methods */
void   admin__config_dump__init
                     (Admin__ConfigDump         *message);
size_t admin__config_dump__get_packed_size
                     (const Admin__ConfigDump   *message);
size_t admin__config_dump__pack
                     (const Admin__ConfigDump   *message,
                      uint8_t             *out);
size_t admin__config_dump__pack_to_buffer
                     (const Admin__ConfigDump   *message,
                      ProtobufCBuffer     *buffer);
Admin__ConfigDump *
       admin__config_dump__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   admin__config_dump__free_unpacked
                     (Admin__ConfigDump *message,
                      ProtobufCAllocator *allocator);
/* Admin__ConfigResources methods */
void   admin__config_resources__init
                     (Admin__ConfigResources         *message);
size_t admin__config_resources__get_packed_size
                     (const Admin__ConfigResources   *message);
size_t admin__config_resources__pack
                     (const Admin__ConfigResources   *message,
                      uint8_t             *out);
size_t admin__config_resources__pack_to_buffer
                     (const Admin__ConfigResources   *message,
                      ProtobufCBuffer     *buffer);
Admin__ConfigResources *
       admin__config_resources__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   admin__config_resources__free_unpacked
                     (Admin__ConfigResources *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Admin__ConfigDump_Closure)
                 (const Admin__ConfigDump *message,
                  void *closure_data);
typedef void (*Admin__ConfigResources_Closure)
                 (const Admin__ConfigResources *message,
                  void *closure_data);

/* --- services --- */


/* --- descriptors --- */

extern const ProtobufCMessageDescriptor admin__config_dump__descriptor;
extern const ProtobufCMessageDescriptor admin__config_resources__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_api_2fadmin_2fconfig_5fdump_2eproto__INCLUDED */
