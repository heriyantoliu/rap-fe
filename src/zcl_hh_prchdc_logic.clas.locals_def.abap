*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
class lcl_abap_behv_msg DEFINITION
create public
INHERITING FROM cx_no_check.
  public section.
    interfaces if_abap_behv_message.

    aliases:
      msgty for if_t100_dyn_msg~msgty,
      msgv1 for if_t100_dyn_msg~msgv1,
      msgv2 for if_t100_dyn_msg~msgv2,
      msgv3 for if_t100_dyn_msg~msgv3,
      msgv4 for if_t100_dyn_msg~msgv4.

    methods constructor
      importing
        textid like if_t100_message=>t100key optional
        previous like previous optional
        msgty type symsgty optional
        msgv1 type simple optional
        msgv2 type simple optional
        msgv3 type simple optional
        msgv4 type simple optional.
endclass.
