# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "1 - 1",
        dst_template := "0",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "2 - 1",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "0 + number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "0 * number",
        dst_template := "0",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "1 * number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number * 1",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "QUO_INT( number, 1 )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "list{[ ]}",
        dst_template := "[ ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "list{[ 1 ]}",
        dst_template := "[ list[1] ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry", "pos" ],
        src_template := "[ entry ][pos]",
        dst_template := "entry",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "Product( [ ] )",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        src_template := "Product( [ ], func )",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry" ],
        src_template := "Product( [ entry ] )",
        dst_template := "entry",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2" ],
        src_template := "Product( [ entry1, entry2 ] )",
        dst_template := "entry1 * entry2",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry", "func" ],
        src_template := "Product( [ entry ], func )",
        dst_template := "func( entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        src_template := "Sum( [ 1, 2 ], func )",
        dst_template := "func( 1 ) + func( 2 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "constant" ],
        src_template := "List( list, i -> constant )",
        dst_template := "ListWithIdenticalEntries( Length( list ), constant )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "constant", "pos" ],
        src_template := "ListWithIdenticalEntries( length, constant )[pos]",
        dst_template := "constant",
    )
);
