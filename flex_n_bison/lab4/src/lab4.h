typedef struct _varNode{
	char *name;
	int value;
} t_varNode;

typedef struct _constNode{
	int value;
} t_constNode;

typedef struct _opNode{
	int type; //numerical value of token
	int n; //how many operands
	struct _node **operands; //same as : 	struct _node *operands[];
} t_opNode;

typedef struct _blockNode{
	int n; //how many statements
	struct _node **statements;
} t_blockNode;

typedef struct _stringNode{
	char *s;
} t_stringNode;

typedef enum { tVar, tConst, tOp, tBlock, tString} t_nodeType;


typedef struct _node{
	t_nodeType type;
	union {	
		t_varNode *var;
		t_constNode con;
		t_opNode op;
		t_blockNode block;
		t_stringNode str;
	};
} t_node;
