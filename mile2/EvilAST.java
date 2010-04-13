// $ANTLR 3.1.3 Mar 18, 2009 10:09:25 EvilAST.g 2010-04-12 21:06:11

import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;import java.util.Stack;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

public class EvilAST extends TreeParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "STRUCT", "INT", "BOOL", "FUN", "VOID", "PRINT", "ENDL", "READ", "IF", "ELSE", "WHILE", "DELETE", "RETURN", "TRUE", "FALSE", "NEW", "NULL", "PROGRAM", "TYPES", "TYPE", "DECLS", "FUNCS", "DECL", "DECLLIST", "PARAMS", "RETTYPE", "BLOCK", "STMTS", "INVOKE", "ARGS", "NEG", "LBRACE", "RBRACE", "SEMI", "COMMA", "LPAREN", "RPAREN", "ASSIGN", "DOT", "AND", "OR", "EQ", "LT", "GT", "NE", "LE", "GE", "PLUS", "MINUS", "TIMES", "DIVIDE", "NOT", "ID", "INTEGER", "WS", "COMMENT"
    };
    public static final int LT=46;
    public static final int WHILE=14;
    public static final int LBRACE=35;
    public static final int STMTS=31;
    public static final int NEW=19;
    public static final int TYPES=22;
    public static final int NOT=55;
    public static final int AND=43;
    public static final int ID=56;
    public static final int EOF=-1;
    public static final int LPAREN=39;
    public static final int RETTYPE=29;
    public static final int TYPE=23;
    public static final int IF=12;
    public static final int RPAREN=40;
    public static final int DECLLIST=27;
    public static final int COMMA=38;
    public static final int RETURN=16;
    public static final int ARGS=33;
    public static final int PLUS=51;
    public static final int VOID=8;
    public static final int EQ=45;
    public static final int COMMENT=59;
    public static final int DOT=42;
    public static final int DIVIDE=54;
    public static final int NE=48;
    public static final int PARAMS=28;
    public static final int INTEGER=57;
    public static final int GE=50;
    public static final int RBRACE=36;
    public static final int NULL=20;
    public static final int ELSE=13;
    public static final int BOOL=6;
    public static final int STRUCT=4;
    public static final int INT=5;
    public static final int DELETE=15;
    public static final int MINUS=52;
    public static final int DECLS=24;
    public static final int TRUE=17;
    public static final int SEMI=37;
    public static final int PRINT=9;
    public static final int WS=58;
    public static final int ENDL=10;
    public static final int READ=11;
    public static final int DECL=26;
    public static final int BLOCK=30;
    public static final int NEG=34;
    public static final int OR=44;
    public static final int ASSIGN=41;
    public static final int GT=47;
    public static final int PROGRAM=21;
    public static final int FUNCS=25;
    public static final int INVOKE=32;
    public static final int FUN=7;
    public static final int TIMES=53;
    public static final int FALSE=18;
    public static final int LE=49;

    // delegates
    // delegators


        public EvilAST(TreeNodeStream input) {
            this(input, new RecognizerSharedState());
        }
        public EvilAST(TreeNodeStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        
    protected TreeAdaptor adaptor = new CommonTreeAdaptor();

    public void setTreeAdaptor(TreeAdaptor adaptor) {
        this.adaptor = adaptor;
    }
    public TreeAdaptor getTreeAdaptor() {
        return adaptor;
    }

    public String[] getTokenNames() { return EvilAST.tokenNames; }
    public String getGrammarFileName() { return "EvilAST.g"; }


    public static class program_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "program"
    // EvilAST.g:11:1: program : ^( PROGRAM t= types d= declarations f= functions ) ;
    public final EvilAST.program_return program() throws RecognitionException {
        EvilAST.program_return retval = new EvilAST.program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree PROGRAM1=null;
        EvilAST.types_return t = null;

        EvilAST.declarations_return d = null;

        EvilAST.functions_return f = null;


        CommonTree PROGRAM1_tree=null;

        try {
            // EvilAST.g:12:4: ( ^( PROGRAM t= types d= declarations f= functions ) )
            // EvilAST.g:12:6: ^( PROGRAM t= types d= declarations f= functions )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            PROGRAM1=(CommonTree)match(input,PROGRAM,FOLLOW_PROGRAM_in_program66); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            PROGRAM1_tree = (CommonTree)adaptor.dupNode(PROGRAM1);

            root_1 = (CommonTree)adaptor.becomeRoot(PROGRAM1_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_types_in_program70);
            t=types();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, t.getTree());
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_declarations_in_program74);
            d=declarations();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, d.getTree());
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_functions_in_program78);
            f=functions();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, f.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "program"

    public static class types_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "types"
    // EvilAST.g:15:1: types : ( ^( TYPES type_sub ) | TYPES );
    public final EvilAST.types_return types() throws RecognitionException {
        EvilAST.types_return retval = new EvilAST.types_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree TYPES2=null;
        CommonTree TYPES4=null;
        EvilAST.type_sub_return type_sub3 = null;


        CommonTree TYPES2_tree=null;
        CommonTree TYPES4_tree=null;

        try {
            // EvilAST.g:16:4: ( ^( TYPES type_sub ) | TYPES )
            int alt1=2;
            int LA1_0 = input.LA(1);

            if ( (LA1_0==TYPES) ) {
                int LA1_1 = input.LA(2);

                if ( (LA1_1==DOWN) ) {
                    alt1=1;
                }
                else if ( (LA1_1==DECLS) ) {
                    alt1=2;
                }
                else {
                    if (state.backtracking>0) {state.failed=true; return retval;}
                    NoViableAltException nvae =
                        new NoViableAltException("", 1, 1, input);

                    throw nvae;
                }
            }
            else {
                if (state.backtracking>0) {state.failed=true; return retval;}
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // EvilAST.g:16:6: ^( TYPES type_sub )
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
                    TYPES2=(CommonTree)match(input,TYPES,FOLLOW_TYPES_in_types97); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    TYPES2_tree = (CommonTree)adaptor.dupNode(TYPES2);

                    root_1 = (CommonTree)adaptor.becomeRoot(TYPES2_tree, root_1);
                    }


                    if ( input.LA(1)==Token.DOWN ) {
                        match(input, Token.DOWN, null); if (state.failed) return retval;
                        _last = (CommonTree)input.LT(1);
                        pushFollow(FOLLOW_type_sub_in_types99);
                        type_sub3=type_sub();

                        state._fsp--;
                        if (state.failed) return retval;
                        if ( state.backtracking==0 ) 
                        adaptor.addChild(root_1, type_sub3.getTree());

                        match(input, Token.UP, null); if (state.failed) return retval;
                    }adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }


                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 2 :
                    // EvilAST.g:17:8: TYPES
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    TYPES4=(CommonTree)match(input,TYPES,FOLLOW_TYPES_in_types109); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    TYPES4_tree = (CommonTree)adaptor.dupNode(TYPES4);

                    adaptor.addChild(root_0, TYPES4_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }
            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "types"

    public static class type_sub_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "type_sub"
    // EvilAST.g:20:1: type_sub : ( type_declaration type_sub | );
    public final EvilAST.type_sub_return type_sub() throws RecognitionException {
        EvilAST.type_sub_return retval = new EvilAST.type_sub_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        EvilAST.type_declaration_return type_declaration5 = null;

        EvilAST.type_sub_return type_sub6 = null;



        try {
            // EvilAST.g:21:4: ( type_declaration type_sub | )
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==STRUCT) ) {
                alt2=1;
            }
            else if ( (LA2_0==EOF||LA2_0==UP) ) {
                alt2=2;
            }
            else {
                if (state.backtracking>0) {state.failed=true; return retval;}
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // EvilAST.g:21:6: type_declaration type_sub
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_type_declaration_in_type_sub124);
                    type_declaration5=type_declaration();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, type_declaration5.getTree());
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_type_sub_in_type_sub126);
                    type_sub6=type_sub();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, type_sub6.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 2 :
                    // EvilAST.g:23:4: 
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }
            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "type_sub"

    public static class type_declaration_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "type_declaration"
    // EvilAST.g:25:1: type_declaration : ^( STRUCT id= ID nested_decl ) ;
    public final EvilAST.type_declaration_return type_declaration() throws RecognitionException {
        EvilAST.type_declaration_return retval = new EvilAST.type_declaration_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree id=null;
        CommonTree STRUCT7=null;
        EvilAST.nested_decl_return nested_decl8 = null;


        CommonTree id_tree=null;
        CommonTree STRUCT7_tree=null;

        try {
            // EvilAST.g:26:4: ( ^( STRUCT id= ID nested_decl ) )
            // EvilAST.g:26:6: ^( STRUCT id= ID nested_decl )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            STRUCT7=(CommonTree)match(input,STRUCT,FOLLOW_STRUCT_in_type_declaration150); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            STRUCT7_tree = (CommonTree)adaptor.dupNode(STRUCT7);

            root_1 = (CommonTree)adaptor.becomeRoot(STRUCT7_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_type_declaration154); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            id_tree = (CommonTree)adaptor.dupNode(id);

            adaptor.addChild(root_1, id_tree);
            }
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_nested_decl_in_type_declaration156);
            nested_decl8=nested_decl();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, nested_decl8.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "type_declaration"

    public static class nested_decl_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "nested_decl"
    // EvilAST.g:29:1: nested_decl : ( decl )+ ;
    public final EvilAST.nested_decl_return nested_decl() throws RecognitionException {
        EvilAST.nested_decl_return retval = new EvilAST.nested_decl_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        EvilAST.decl_return decl9 = null;



        try {
            // EvilAST.g:30:4: ( ( decl )+ )
            // EvilAST.g:30:6: ( decl )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // EvilAST.g:30:6: ( decl )+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);

                if ( (LA3_0==DECL) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // EvilAST.g:0:0: decl
            	    {
            	    _last = (CommonTree)input.LT(1);
            	    pushFollow(FOLLOW_decl_in_nested_decl174);
            	    decl9=decl();

            	    state._fsp--;
            	    if (state.failed) return retval;
            	    if ( state.backtracking==0 ) 
            	    adaptor.addChild(root_0, decl9.getTree());

            	    if ( state.backtracking==0 ) {
            	    }
            	    }
            	    break;

            	default :
            	    if ( cnt3 >= 1 ) break loop3;
            	    if (state.backtracking>0) {state.failed=true; return retval;}
                        EarlyExitException eee =
                            new EarlyExitException(3, input);
                        throw eee;
                }
                cnt3++;
            } while (true);


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "nested_decl"

    public static class decl_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "decl"
    // EvilAST.g:33:1: decl : ^( DECL ^( TYPE t= type ) id= ID ) ;
    public final EvilAST.decl_return decl() throws RecognitionException {
        EvilAST.decl_return retval = new EvilAST.decl_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree id=null;
        CommonTree DECL10=null;
        CommonTree TYPE11=null;
        EvilAST.type_return t = null;


        CommonTree id_tree=null;
        CommonTree DECL10_tree=null;
        CommonTree TYPE11_tree=null;

        try {
            // EvilAST.g:34:4: ( ^( DECL ^( TYPE t= type ) id= ID ) )
            // EvilAST.g:34:6: ^( DECL ^( TYPE t= type ) id= ID )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            DECL10=(CommonTree)match(input,DECL,FOLLOW_DECL_in_decl191); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            DECL10_tree = (CommonTree)adaptor.dupNode(DECL10);

            root_1 = (CommonTree)adaptor.becomeRoot(DECL10_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_2 = _last;
            CommonTree _first_2 = null;
            CommonTree root_2 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            TYPE11=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_decl194); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            TYPE11_tree = (CommonTree)adaptor.dupNode(TYPE11);

            root_2 = (CommonTree)adaptor.becomeRoot(TYPE11_tree, root_2);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_type_in_decl198);
            t=type();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_2, t.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_1, root_2);_last = _save_last_2;
            }

            _last = (CommonTree)input.LT(1);
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_decl203); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            id_tree = (CommonTree)adaptor.dupNode(id);

            adaptor.addChild(root_1, id_tree);
            }

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "decl"

    public static class type_return extends TreeRuleReturnScope {
        public String t = null;
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "type"
    // EvilAST.g:37:1: type returns [String t = null] : ( INT | BOOL | ^( STRUCT id= ID ) );
    public final EvilAST.type_return type() throws RecognitionException {
        EvilAST.type_return retval = new EvilAST.type_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree id=null;
        CommonTree INT12=null;
        CommonTree BOOL13=null;
        CommonTree STRUCT14=null;

        CommonTree id_tree=null;
        CommonTree INT12_tree=null;
        CommonTree BOOL13_tree=null;
        CommonTree STRUCT14_tree=null;

        try {
            // EvilAST.g:38:4: ( INT | BOOL | ^( STRUCT id= ID ) )
            int alt4=3;
            switch ( input.LA(1) ) {
            case INT:
                {
                alt4=1;
                }
                break;
            case BOOL:
                {
                alt4=2;
                }
                break;
            case STRUCT:
                {
                alt4=3;
                }
                break;
            default:
                if (state.backtracking>0) {state.failed=true; return retval;}
                NoViableAltException nvae =
                    new NoViableAltException("", 4, 0, input);

                throw nvae;
            }

            switch (alt4) {
                case 1 :
                    // EvilAST.g:38:6: INT
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    INT12=(CommonTree)match(input,INT,FOLLOW_INT_in_type223); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    INT12_tree = (CommonTree)adaptor.dupNode(INT12);

                    adaptor.addChild(root_0, INT12_tree);
                    }
                    if ( state.backtracking==0 ) {
                       retval.t = SymTable.intType(); 
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 2 :
                    // EvilAST.g:39:6: BOOL
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    BOOL13=(CommonTree)match(input,BOOL,FOLLOW_BOOL_in_type232); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    BOOL13_tree = (CommonTree)adaptor.dupNode(BOOL13);

                    adaptor.addChild(root_0, BOOL13_tree);
                    }
                    if ( state.backtracking==0 ) {
                       retval.t = SymTable.boolType(); 
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 3 :
                    // EvilAST.g:40:6: ^( STRUCT id= ID )
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
                    STRUCT14=(CommonTree)match(input,STRUCT,FOLLOW_STRUCT_in_type242); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    STRUCT14_tree = (CommonTree)adaptor.dupNode(STRUCT14);

                    root_1 = (CommonTree)adaptor.becomeRoot(STRUCT14_tree, root_1);
                    }


                    match(input, Token.DOWN, null); if (state.failed) return retval;
                    _last = (CommonTree)input.LT(1);
                    id=(CommonTree)match(input,ID,FOLLOW_ID_in_type246); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    id_tree = (CommonTree)adaptor.dupNode(id);

                    adaptor.addChild(root_1, id_tree);
                    }

                    match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }

                    if ( state.backtracking==0 ) {

                              /*if (!$envChain.isDefined((id!=null?id.getText():null)))
                              {
                                 System.err.println("line " + (id!=null?id.getLine():0) + ": undefined struct type '" + id + "'");
                              }*/
                              retval.t = SymTable.structType((id!=null?id.getText():null));
                           
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }
            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "type"

    public static class declarations_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "declarations"
    // EvilAST.g:50:1: declarations : ^( DECLS ( declaration )* ) ;
    public final EvilAST.declarations_return declarations() throws RecognitionException {
        EvilAST.declarations_return retval = new EvilAST.declarations_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree DECLS15=null;
        EvilAST.declaration_return declaration16 = null;


        CommonTree DECLS15_tree=null;

        try {
            // EvilAST.g:51:4: ( ^( DECLS ( declaration )* ) )
            // EvilAST.g:51:6: ^( DECLS ( declaration )* )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            DECLS15=(CommonTree)match(input,DECLS,FOLLOW_DECLS_in_declarations272); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            DECLS15_tree = (CommonTree)adaptor.dupNode(DECLS15);

            root_1 = (CommonTree)adaptor.becomeRoot(DECLS15_tree, root_1);
            }


            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); if (state.failed) return retval;
                // EvilAST.g:51:14: ( declaration )*
                loop5:
                do {
                    int alt5=2;
                    int LA5_0 = input.LA(1);

                    if ( (LA5_0==DECLLIST) ) {
                        alt5=1;
                    }


                    switch (alt5) {
                	case 1 :
                	    // EvilAST.g:0:0: declaration
                	    {
                	    _last = (CommonTree)input.LT(1);
                	    pushFollow(FOLLOW_declaration_in_declarations274);
                	    declaration16=declaration();

                	    state._fsp--;
                	    if (state.failed) return retval;
                	    if ( state.backtracking==0 ) 
                	    adaptor.addChild(root_1, declaration16.getTree());

                	    if ( state.backtracking==0 ) {
                	    }
                	    }
                	    break;

                	default :
                	    break loop5;
                    }
                } while (true);


                match(input, Token.UP, null); if (state.failed) return retval;
            }adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "declarations"

    public static class declaration_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "declaration"
    // EvilAST.g:54:1: declaration : ^( DECLLIST ^( TYPE t= type ) id_list ) ;
    public final EvilAST.declaration_return declaration() throws RecognitionException {
        EvilAST.declaration_return retval = new EvilAST.declaration_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree DECLLIST17=null;
        CommonTree TYPE18=null;
        EvilAST.type_return t = null;

        EvilAST.id_list_return id_list19 = null;


        CommonTree DECLLIST17_tree=null;
        CommonTree TYPE18_tree=null;

        try {
            // EvilAST.g:55:4: ( ^( DECLLIST ^( TYPE t= type ) id_list ) )
            // EvilAST.g:55:6: ^( DECLLIST ^( TYPE t= type ) id_list )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            DECLLIST17=(CommonTree)match(input,DECLLIST,FOLLOW_DECLLIST_in_declaration292); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            DECLLIST17_tree = (CommonTree)adaptor.dupNode(DECLLIST17);

            root_1 = (CommonTree)adaptor.becomeRoot(DECLLIST17_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_2 = _last;
            CommonTree _first_2 = null;
            CommonTree root_2 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            TYPE18=(CommonTree)match(input,TYPE,FOLLOW_TYPE_in_declaration295); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            TYPE18_tree = (CommonTree)adaptor.dupNode(TYPE18);

            root_2 = (CommonTree)adaptor.becomeRoot(TYPE18_tree, root_2);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_type_in_declaration299);
            t=type();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_2, t.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_1, root_2);_last = _save_last_2;
            }

            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_id_list_in_declaration302);
            id_list19=id_list();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, id_list19.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "declaration"

    public static class id_list_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "id_list"
    // EvilAST.g:58:1: id_list : ^(id= ID ( id_list )+ ) ;
    public final EvilAST.id_list_return id_list() throws RecognitionException {
        EvilAST.id_list_return retval = new EvilAST.id_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree id=null;
        EvilAST.id_list_return id_list20 = null;


        CommonTree id_tree=null;

        try {
            // EvilAST.g:59:4: ( ^(id= ID ( id_list )+ ) )
            // EvilAST.g:59:6: ^(id= ID ( id_list )+ )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_id_list321); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            id_tree = (CommonTree)adaptor.dupNode(id);

            root_1 = (CommonTree)adaptor.becomeRoot(id_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            // EvilAST.g:59:14: ( id_list )+
            int cnt6=0;
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);

                if ( (LA6_0==ID) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // EvilAST.g:0:0: id_list
            	    {
            	    _last = (CommonTree)input.LT(1);
            	    pushFollow(FOLLOW_id_list_in_id_list323);
            	    id_list20=id_list();

            	    state._fsp--;
            	    if (state.failed) return retval;
            	    if ( state.backtracking==0 ) 
            	    adaptor.addChild(root_1, id_list20.getTree());

            	    if ( state.backtracking==0 ) {
            	    }
            	    }
            	    break;

            	default :
            	    if ( cnt6 >= 1 ) break loop6;
            	    if (state.backtracking>0) {state.failed=true; return retval;}
                        EarlyExitException eee =
                            new EarlyExitException(6, input);
                        throw eee;
                }
                cnt6++;
            } while (true);


            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "id_list"

    public static class functions_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "functions"
    // EvilAST.g:62:1: functions : ^( FUNCS ( function )* ) ;
    public final EvilAST.functions_return functions() throws RecognitionException {
        EvilAST.functions_return retval = new EvilAST.functions_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree FUNCS21=null;
        EvilAST.function_return function22 = null;


        CommonTree FUNCS21_tree=null;

        try {
            // EvilAST.g:63:4: ( ^( FUNCS ( function )* ) )
            // EvilAST.g:63:6: ^( FUNCS ( function )* )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            FUNCS21=(CommonTree)match(input,FUNCS,FOLLOW_FUNCS_in_functions344); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            FUNCS21_tree = (CommonTree)adaptor.dupNode(FUNCS21);

            root_1 = (CommonTree)adaptor.becomeRoot(FUNCS21_tree, root_1);
            }


            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); if (state.failed) return retval;
                // EvilAST.g:63:14: ( function )*
                loop7:
                do {
                    int alt7=2;
                    int LA7_0 = input.LA(1);

                    if ( (LA7_0==FUN) ) {
                        alt7=1;
                    }


                    switch (alt7) {
                	case 1 :
                	    // EvilAST.g:0:0: function
                	    {
                	    _last = (CommonTree)input.LT(1);
                	    pushFollow(FOLLOW_function_in_functions346);
                	    function22=function();

                	    state._fsp--;
                	    if (state.failed) return retval;
                	    if ( state.backtracking==0 ) 
                	    adaptor.addChild(root_1, function22.getTree());

                	    if ( state.backtracking==0 ) {
                	    }
                	    }
                	    break;

                	default :
                	    break loop7;
                    }
                } while (true);


                match(input, Token.UP, null); if (state.failed) return retval;
            }adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "functions"

    public static class function_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "function"
    // EvilAST.g:66:1: function : ^( FUN id= ID param= parameters ^( RETTYPE retType= return_type ) funDecls= declarations funBody= statement_list ) ;
    public final EvilAST.function_return function() throws RecognitionException {
        EvilAST.function_return retval = new EvilAST.function_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree id=null;
        CommonTree FUN23=null;
        CommonTree RETTYPE24=null;
        EvilAST.parameters_return param = null;

        EvilAST.return_type_return retType = null;

        EvilAST.declarations_return funDecls = null;

        EvilAST.statement_list_return funBody = null;


        CommonTree id_tree=null;
        CommonTree FUN23_tree=null;
        CommonTree RETTYPE24_tree=null;

        try {
            // EvilAST.g:67:4: ( ^( FUN id= ID param= parameters ^( RETTYPE retType= return_type ) funDecls= declarations funBody= statement_list ) )
            // EvilAST.g:67:6: ^( FUN id= ID param= parameters ^( RETTYPE retType= return_type ) funDecls= declarations funBody= statement_list )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            FUN23=(CommonTree)match(input,FUN,FOLLOW_FUN_in_function364); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            FUN23_tree = new FunctionTree(FUN23);

            root_1 = (CommonTree)adaptor.becomeRoot(FUN23_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_function371); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            id_tree = (CommonTree)adaptor.dupNode(id);

            adaptor.addChild(root_1, id_tree);
            }
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_parameters_in_function375);
            param=parameters();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, param.getTree());
            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_2 = _last;
            CommonTree _first_2 = null;
            CommonTree root_2 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            RETTYPE24=(CommonTree)match(input,RETTYPE,FOLLOW_RETTYPE_in_function384); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            RETTYPE24_tree = (CommonTree)adaptor.dupNode(RETTYPE24);

            root_2 = (CommonTree)adaptor.becomeRoot(RETTYPE24_tree, root_2);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_return_type_in_function388);
            retType=return_type();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_2, retType.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_1, root_2);_last = _save_last_2;
            }

            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_declarations_in_function393);
            funDecls=declarations();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, funDecls.getTree());
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_statement_list_in_function397);
            funBody=statement_list();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, funBody.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "function"

    public static class parameters_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "parameters"
    // EvilAST.g:75:1: parameters : ^( PARAMS ( decl )* ) ;
    public final EvilAST.parameters_return parameters() throws RecognitionException {
        EvilAST.parameters_return retval = new EvilAST.parameters_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree PARAMS25=null;
        EvilAST.decl_return decl26 = null;


        CommonTree PARAMS25_tree=null;

        try {
            // EvilAST.g:76:4: ( ^( PARAMS ( decl )* ) )
            // EvilAST.g:76:6: ^( PARAMS ( decl )* )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            PARAMS25=(CommonTree)match(input,PARAMS,FOLLOW_PARAMS_in_parameters421); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            PARAMS25_tree = (CommonTree)adaptor.dupNode(PARAMS25);

            root_1 = (CommonTree)adaptor.becomeRoot(PARAMS25_tree, root_1);
            }


            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); if (state.failed) return retval;
                // EvilAST.g:76:15: ( decl )*
                loop8:
                do {
                    int alt8=2;
                    int LA8_0 = input.LA(1);

                    if ( (LA8_0==DECL) ) {
                        alt8=1;
                    }


                    switch (alt8) {
                	case 1 :
                	    // EvilAST.g:0:0: decl
                	    {
                	    _last = (CommonTree)input.LT(1);
                	    pushFollow(FOLLOW_decl_in_parameters423);
                	    decl26=decl();

                	    state._fsp--;
                	    if (state.failed) return retval;
                	    if ( state.backtracking==0 ) 
                	    adaptor.addChild(root_1, decl26.getTree());

                	    if ( state.backtracking==0 ) {
                	    }
                	    }
                	    break;

                	default :
                	    break loop8;
                    }
                } while (true);


                match(input, Token.UP, null); if (state.failed) return retval;
            }adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "parameters"

    public static class return_type_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "return_type"
    // EvilAST.g:79:1: return_type : ( type | VOID );
    public final EvilAST.return_type_return return_type() throws RecognitionException {
        EvilAST.return_type_return retval = new EvilAST.return_type_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree VOID28=null;
        EvilAST.type_return type27 = null;


        CommonTree VOID28_tree=null;

        try {
            // EvilAST.g:80:4: ( type | VOID )
            int alt9=2;
            int LA9_0 = input.LA(1);

            if ( ((LA9_0>=STRUCT && LA9_0<=BOOL)) ) {
                alt9=1;
            }
            else if ( (LA9_0==VOID) ) {
                alt9=2;
            }
            else {
                if (state.backtracking>0) {state.failed=true; return retval;}
                NoViableAltException nvae =
                    new NoViableAltException("", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // EvilAST.g:80:6: type
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_type_in_return_type440);
                    type27=type();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, type27.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 2 :
                    // EvilAST.g:81:6: VOID
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    VOID28=(CommonTree)match(input,VOID,FOLLOW_VOID_in_return_type447); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    VOID28_tree = (CommonTree)adaptor.dupNode(VOID28);

                    adaptor.addChild(root_0, VOID28_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }
            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "return_type"

    public static class statement_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "statement"
    // EvilAST.g:84:1: statement : ( block | assignment | print | read | conditional | loop | delete | ret | invocation );
    public final EvilAST.statement_return statement() throws RecognitionException {
        EvilAST.statement_return retval = new EvilAST.statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        EvilAST.block_return block29 = null;

        EvilAST.assignment_return assignment30 = null;

        EvilAST.print_return print31 = null;

        EvilAST.read_return read32 = null;

        EvilAST.conditional_return conditional33 = null;

        EvilAST.loop_return loop34 = null;

        EvilAST.delete_return delete35 = null;

        EvilAST.ret_return ret36 = null;

        EvilAST.invocation_return invocation37 = null;



        try {
            // EvilAST.g:85:4: ( block | assignment | print | read | conditional | loop | delete | ret | invocation )
            int alt10=9;
            switch ( input.LA(1) ) {
            case BLOCK:
                {
                alt10=1;
                }
                break;
            case ASSIGN:
                {
                alt10=2;
                }
                break;
            case PRINT:
                {
                alt10=3;
                }
                break;
            case READ:
                {
                alt10=4;
                }
                break;
            case IF:
                {
                alt10=5;
                }
                break;
            case WHILE:
                {
                alt10=6;
                }
                break;
            case DELETE:
                {
                alt10=7;
                }
                break;
            case RETURN:
                {
                alt10=8;
                }
                break;
            case INVOKE:
                {
                alt10=9;
                }
                break;
            default:
                if (state.backtracking>0) {state.failed=true; return retval;}
                NoViableAltException nvae =
                    new NoViableAltException("", 10, 0, input);

                throw nvae;
            }

            switch (alt10) {
                case 1 :
                    // EvilAST.g:85:6: block
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_block_in_statement462);
                    block29=block();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, block29.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 2 :
                    // EvilAST.g:86:6: assignment
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_assignment_in_statement469);
                    assignment30=assignment();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, assignment30.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 3 :
                    // EvilAST.g:87:6: print
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_print_in_statement476);
                    print31=print();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, print31.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 4 :
                    // EvilAST.g:88:6: read
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_read_in_statement483);
                    read32=read();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, read32.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 5 :
                    // EvilAST.g:89:6: conditional
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_conditional_in_statement490);
                    conditional33=conditional();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, conditional33.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 6 :
                    // EvilAST.g:90:6: loop
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_loop_in_statement497);
                    loop34=loop();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, loop34.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 7 :
                    // EvilAST.g:91:6: delete
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_delete_in_statement504);
                    delete35=delete();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, delete35.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 8 :
                    // EvilAST.g:92:6: ret
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_ret_in_statement511);
                    ret36=ret();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, ret36.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 9 :
                    // EvilAST.g:93:6: invocation
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_invocation_in_statement518);
                    invocation37=invocation();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, invocation37.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }
            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "statement"

    public static class block_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "block"
    // EvilAST.g:96:1: block : ^( BLOCK statement_list ) ;
    public final EvilAST.block_return block() throws RecognitionException {
        EvilAST.block_return retval = new EvilAST.block_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree BLOCK38=null;
        EvilAST.statement_list_return statement_list39 = null;


        CommonTree BLOCK38_tree=null;

        try {
            // EvilAST.g:97:4: ( ^( BLOCK statement_list ) )
            // EvilAST.g:97:6: ^( BLOCK statement_list )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            BLOCK38=(CommonTree)match(input,BLOCK,FOLLOW_BLOCK_in_block534); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            BLOCK38_tree = (CommonTree)adaptor.dupNode(BLOCK38);

            root_1 = (CommonTree)adaptor.becomeRoot(BLOCK38_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_statement_list_in_block536);
            statement_list39=statement_list();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, statement_list39.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "block"

    public static class statement_list_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "statement_list"
    // EvilAST.g:100:1: statement_list : ^( STMTS ( statement )* ) ;
    public final EvilAST.statement_list_return statement_list() throws RecognitionException {
        EvilAST.statement_list_return retval = new EvilAST.statement_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree STMTS40=null;
        EvilAST.statement_return statement41 = null;


        CommonTree STMTS40_tree=null;

        try {
            // EvilAST.g:101:4: ( ^( STMTS ( statement )* ) )
            // EvilAST.g:101:6: ^( STMTS ( statement )* )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            STMTS40=(CommonTree)match(input,STMTS,FOLLOW_STMTS_in_statement_list553); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            STMTS40_tree = (CommonTree)adaptor.dupNode(STMTS40);

            root_1 = (CommonTree)adaptor.becomeRoot(STMTS40_tree, root_1);
            }


            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); if (state.failed) return retval;
                // EvilAST.g:101:14: ( statement )*
                loop11:
                do {
                    int alt11=2;
                    int LA11_0 = input.LA(1);

                    if ( (LA11_0==PRINT||(LA11_0>=READ && LA11_0<=IF)||(LA11_0>=WHILE && LA11_0<=RETURN)||LA11_0==BLOCK||LA11_0==INVOKE||LA11_0==ASSIGN) ) {
                        alt11=1;
                    }


                    switch (alt11) {
                	case 1 :
                	    // EvilAST.g:0:0: statement
                	    {
                	    _last = (CommonTree)input.LT(1);
                	    pushFollow(FOLLOW_statement_in_statement_list555);
                	    statement41=statement();

                	    state._fsp--;
                	    if (state.failed) return retval;
                	    if ( state.backtracking==0 ) 
                	    adaptor.addChild(root_1, statement41.getTree());

                	    if ( state.backtracking==0 ) {
                	    }
                	    }
                	    break;

                	default :
                	    break loop11;
                    }
                } while (true);


                match(input, Token.UP, null); if (state.failed) return retval;
            }adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "statement_list"

    public static class assignment_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "assignment"
    // EvilAST.g:104:1: assignment : ^( ASSIGN expr= expression lval= lvalue ) ;
    public final EvilAST.assignment_return assignment() throws RecognitionException {
        EvilAST.assignment_return retval = new EvilAST.assignment_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree ASSIGN42=null;
        EvilAST.expression_return expr = null;

        EvilAST.lvalue_return lval = null;


        CommonTree ASSIGN42_tree=null;

        try {
            // EvilAST.g:105:4: ( ^( ASSIGN expr= expression lval= lvalue ) )
            // EvilAST.g:105:6: ^( ASSIGN expr= expression lval= lvalue )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            ASSIGN42=(CommonTree)match(input,ASSIGN,FOLLOW_ASSIGN_in_assignment573); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            ASSIGN42_tree = (CommonTree)adaptor.dupNode(ASSIGN42);

            root_1 = (CommonTree)adaptor.becomeRoot(ASSIGN42_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_expression_in_assignment577);
            expr=expression();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, expr.getTree());
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_lvalue_in_assignment581);
            lval=lvalue();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, lval.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }

            if ( state.backtracking==0 ) {
              /*
                      if (envChain.isDefined(lval)) {
                         System.err.println("lvalue of assignment undefined");
                      }*/
                      //check that expression is of same type as lvalue
                   
            }

            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "assignment"

    public static class print_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "print"
    // EvilAST.g:114:1: print : PRINT expression ( ENDL )? ;
    public final EvilAST.print_return print() throws RecognitionException {
        EvilAST.print_return retval = new EvilAST.print_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree PRINT43=null;
        CommonTree ENDL45=null;
        EvilAST.expression_return expression44 = null;


        CommonTree PRINT43_tree=null;
        CommonTree ENDL45_tree=null;

        try {
            // EvilAST.g:115:4: ( PRINT expression ( ENDL )? )
            // EvilAST.g:115:6: PRINT expression ( ENDL )?
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            PRINT43=(CommonTree)match(input,PRINT,FOLLOW_PRINT_in_print604); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            PRINT43_tree = (CommonTree)adaptor.dupNode(PRINT43);

            root_0 = (CommonTree)adaptor.becomeRoot(PRINT43_tree, root_0);
            }
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_expression_in_print607);
            expression44=expression();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_0, expression44.getTree());
            // EvilAST.g:115:24: ( ENDL )?
            int alt12=2;
            int LA12_0 = input.LA(1);

            if ( (LA12_0==ENDL) ) {
                alt12=1;
            }
            switch (alt12) {
                case 1 :
                    // EvilAST.g:115:25: ENDL
                    {
                    _last = (CommonTree)input.LT(1);
                    ENDL45=(CommonTree)match(input,ENDL,FOLLOW_ENDL_in_print610); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    ENDL45_tree = (CommonTree)adaptor.dupNode(ENDL45);

                    adaptor.addChild(root_0, ENDL45_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "print"

    public static class read_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "read"
    // EvilAST.g:118:1: read : READ lvalue ;
    public final EvilAST.read_return read() throws RecognitionException {
        EvilAST.read_return retval = new EvilAST.read_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree READ46=null;
        EvilAST.lvalue_return lvalue47 = null;


        CommonTree READ46_tree=null;

        try {
            // EvilAST.g:119:4: ( READ lvalue )
            // EvilAST.g:119:6: READ lvalue
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            READ46=(CommonTree)match(input,READ,FOLLOW_READ_in_read627); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            READ46_tree = (CommonTree)adaptor.dupNode(READ46);

            root_0 = (CommonTree)adaptor.becomeRoot(READ46_tree, root_0);
            }
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_lvalue_in_read630);
            lvalue47=lvalue();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_0, lvalue47.getTree());

            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "read"

    public static class conditional_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "conditional"
    // EvilAST.g:122:1: conditional : IF expression block ( block )? ;
    public final EvilAST.conditional_return conditional() throws RecognitionException {
        EvilAST.conditional_return retval = new EvilAST.conditional_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree IF48=null;
        EvilAST.expression_return expression49 = null;

        EvilAST.block_return block50 = null;

        EvilAST.block_return block51 = null;


        CommonTree IF48_tree=null;

        try {
            // EvilAST.g:123:4: ( IF expression block ( block )? )
            // EvilAST.g:123:6: IF expression block ( block )?
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            IF48=(CommonTree)match(input,IF,FOLLOW_IF_in_conditional645); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            IF48_tree = (CommonTree)adaptor.dupNode(IF48);

            root_0 = (CommonTree)adaptor.becomeRoot(IF48_tree, root_0);
            }
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_expression_in_conditional648);
            expression49=expression();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_0, expression49.getTree());
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_block_in_conditional650);
            block50=block();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_0, block50.getTree());
            // EvilAST.g:123:27: ( block )?
            int alt13=2;
            alt13 = dfa13.predict(input);
            switch (alt13) {
                case 1 :
                    // EvilAST.g:123:28: block
                    {
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_block_in_conditional653);
                    block51=block();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, block51.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "conditional"

    public static class loop_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "loop"
    // EvilAST.g:126:1: loop : ^( WHILE expr= expression b= block expr2= expression ) ;
    public final EvilAST.loop_return loop() throws RecognitionException {
        EvilAST.loop_return retval = new EvilAST.loop_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree WHILE52=null;
        EvilAST.expression_return expr = null;

        EvilAST.block_return b = null;

        EvilAST.expression_return expr2 = null;


        CommonTree WHILE52_tree=null;

        try {
            // EvilAST.g:127:4: ( ^( WHILE expr= expression b= block expr2= expression ) )
            // EvilAST.g:127:6: ^( WHILE expr= expression b= block expr2= expression )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            WHILE52=(CommonTree)match(input,WHILE,FOLLOW_WHILE_in_loop671); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            WHILE52_tree = (CommonTree)adaptor.dupNode(WHILE52);

            root_1 = (CommonTree)adaptor.becomeRoot(WHILE52_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_expression_in_loop675);
            expr=expression();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, expr.getTree());
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_block_in_loop679);
            b=block();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, b.getTree());
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_expression_in_loop683);
            expr2=expression();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, expr2.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "loop"

    public static class delete_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "delete"
    // EvilAST.g:130:1: delete : DELETE expression ;
    public final EvilAST.delete_return delete() throws RecognitionException {
        EvilAST.delete_return retval = new EvilAST.delete_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree DELETE53=null;
        EvilAST.expression_return expression54 = null;


        CommonTree DELETE53_tree=null;

        try {
            // EvilAST.g:131:4: ( DELETE expression )
            // EvilAST.g:131:6: DELETE expression
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            DELETE53=(CommonTree)match(input,DELETE,FOLLOW_DELETE_in_delete699); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            DELETE53_tree = (CommonTree)adaptor.dupNode(DELETE53);

            root_0 = (CommonTree)adaptor.becomeRoot(DELETE53_tree, root_0);
            }
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_expression_in_delete702);
            expression54=expression();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_0, expression54.getTree());

            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "delete"

    public static class ret_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "ret"
    // EvilAST.g:134:1: ret : RETURN ( expression )? ;
    public final EvilAST.ret_return ret() throws RecognitionException {
        EvilAST.ret_return retval = new EvilAST.ret_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree RETURN55=null;
        EvilAST.expression_return expression56 = null;


        CommonTree RETURN55_tree=null;

        try {
            // EvilAST.g:135:4: ( RETURN ( expression )? )
            // EvilAST.g:135:6: RETURN ( expression )?
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            RETURN55=(CommonTree)match(input,RETURN,FOLLOW_RETURN_in_ret717); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            RETURN55_tree = (CommonTree)adaptor.dupNode(RETURN55);

            root_0 = (CommonTree)adaptor.becomeRoot(RETURN55_tree, root_0);
            }
            // EvilAST.g:135:14: ( expression )?
            int alt14=2;
            alt14 = dfa14.predict(input);
            switch (alt14) {
                case 1 :
                    // EvilAST.g:135:15: expression
                    {
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_ret721);
                    expression56=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, expression56.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "ret"

    public static class invocation_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "invocation"
    // EvilAST.g:138:1: invocation : ^( INVOKE id= ID args= arguments ) ;
    public final EvilAST.invocation_return invocation() throws RecognitionException {
        EvilAST.invocation_return retval = new EvilAST.invocation_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree id=null;
        CommonTree INVOKE57=null;
        EvilAST.arguments_return args = null;


        CommonTree id_tree=null;
        CommonTree INVOKE57_tree=null;

        try {
            // EvilAST.g:139:4: ( ^( INVOKE id= ID args= arguments ) )
            // EvilAST.g:139:6: ^( INVOKE id= ID args= arguments )
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            {
            CommonTree _save_last_1 = _last;
            CommonTree _first_1 = null;
            CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
            INVOKE57=(CommonTree)match(input,INVOKE,FOLLOW_INVOKE_in_invocation739); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            INVOKE57_tree = (CommonTree)adaptor.dupNode(INVOKE57);

            root_1 = (CommonTree)adaptor.becomeRoot(INVOKE57_tree, root_1);
            }


            match(input, Token.DOWN, null); if (state.failed) return retval;
            _last = (CommonTree)input.LT(1);
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_invocation743); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            id_tree = (CommonTree)adaptor.dupNode(id);

            adaptor.addChild(root_1, id_tree);
            }
            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_arguments_in_invocation747);
            args=arguments();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_1, args.getTree());

            match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
            }


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "invocation"

    public static class lvalue_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "lvalue"
    // EvilAST.g:142:1: lvalue : ID ( DOT ID )* ;
    public final EvilAST.lvalue_return lvalue() throws RecognitionException {
        EvilAST.lvalue_return retval = new EvilAST.lvalue_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree ID58=null;
        CommonTree DOT59=null;
        CommonTree ID60=null;

        CommonTree ID58_tree=null;
        CommonTree DOT59_tree=null;
        CommonTree ID60_tree=null;

        try {
            // EvilAST.g:143:4: ( ID ( DOT ID )* )
            // EvilAST.g:143:6: ID ( DOT ID )*
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            ID58=(CommonTree)match(input,ID,FOLLOW_ID_in_lvalue763); if (state.failed) return retval;
            if ( state.backtracking==0 ) {
            ID58_tree = (CommonTree)adaptor.dupNode(ID58);

            adaptor.addChild(root_0, ID58_tree);
            }
            // EvilAST.g:143:9: ( DOT ID )*
            loop15:
            do {
                int alt15=2;
                int LA15_0 = input.LA(1);

                if ( (LA15_0==DOT) ) {
                    alt15=1;
                }


                switch (alt15) {
            	case 1 :
            	    // EvilAST.g:143:10: DOT ID
            	    {
            	    _last = (CommonTree)input.LT(1);
            	    DOT59=(CommonTree)match(input,DOT,FOLLOW_DOT_in_lvalue766); if (state.failed) return retval;
            	    if ( state.backtracking==0 ) {
            	    DOT59_tree = new DottedTree(DOT59);

            	    root_0 = (CommonTree)adaptor.becomeRoot(DOT59_tree, root_0);
            	    }
            	    _last = (CommonTree)input.LT(1);
            	    ID60=(CommonTree)match(input,ID,FOLLOW_ID_in_lvalue772); if (state.failed) return retval;
            	    if ( state.backtracking==0 ) {
            	    ID60_tree = (CommonTree)adaptor.dupNode(ID60);

            	    adaptor.addChild(root_0, ID60_tree);
            	    }

            	    if ( state.backtracking==0 ) {
            	    }
            	    }
            	    break;

            	default :
            	    break loop15;
                }
            } while (true);


            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "lvalue"

    public static class expression_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "expression"
    // EvilAST.g:146:1: expression : ( ^( ( AND | OR ) lexpr= expression rexpr= expression ) | ^( ( EQ | LT | GT | NE | LE | GE ) lexpr= expression rexpr= expression ) | ^( ( PLUS | MINUS ) lexpr= expression rexpr= expression ) | ^( ( TIMES | DIVIDE ) lexpr= expression rexpr= expression ) | ^( DOT ID ) expression | ^( INVOKE id= ID args= arguments ) | ID | INTEGER | TRUE | FALSE | NEW ID | NULL );
    public final EvilAST.expression_return expression() throws RecognitionException {
        EvilAST.expression_return retval = new EvilAST.expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree id=null;
        CommonTree AND61=null;
        CommonTree OR62=null;
        CommonTree EQ63=null;
        CommonTree LT64=null;
        CommonTree GT65=null;
        CommonTree NE66=null;
        CommonTree LE67=null;
        CommonTree GE68=null;
        CommonTree PLUS69=null;
        CommonTree MINUS70=null;
        CommonTree TIMES71=null;
        CommonTree DIVIDE72=null;
        CommonTree DOT73=null;
        CommonTree ID74=null;
        CommonTree INVOKE76=null;
        CommonTree ID77=null;
        CommonTree INTEGER78=null;
        CommonTree TRUE79=null;
        CommonTree FALSE80=null;
        CommonTree NEW81=null;
        CommonTree ID82=null;
        CommonTree NULL83=null;
        EvilAST.expression_return lexpr = null;

        EvilAST.expression_return rexpr = null;

        EvilAST.arguments_return args = null;

        EvilAST.expression_return expression75 = null;


        CommonTree id_tree=null;
        CommonTree AND61_tree=null;
        CommonTree OR62_tree=null;
        CommonTree EQ63_tree=null;
        CommonTree LT64_tree=null;
        CommonTree GT65_tree=null;
        CommonTree NE66_tree=null;
        CommonTree LE67_tree=null;
        CommonTree GE68_tree=null;
        CommonTree PLUS69_tree=null;
        CommonTree MINUS70_tree=null;
        CommonTree TIMES71_tree=null;
        CommonTree DIVIDE72_tree=null;
        CommonTree DOT73_tree=null;
        CommonTree ID74_tree=null;
        CommonTree INVOKE76_tree=null;
        CommonTree ID77_tree=null;
        CommonTree INTEGER78_tree=null;
        CommonTree TRUE79_tree=null;
        CommonTree FALSE80_tree=null;
        CommonTree NEW81_tree=null;
        CommonTree ID82_tree=null;
        CommonTree NULL83_tree=null;

        try {
            // EvilAST.g:147:4: ( ^( ( AND | OR ) lexpr= expression rexpr= expression ) | ^( ( EQ | LT | GT | NE | LE | GE ) lexpr= expression rexpr= expression ) | ^( ( PLUS | MINUS ) lexpr= expression rexpr= expression ) | ^( ( TIMES | DIVIDE ) lexpr= expression rexpr= expression ) | ^( DOT ID ) expression | ^( INVOKE id= ID args= arguments ) | ID | INTEGER | TRUE | FALSE | NEW ID | NULL )
            int alt20=12;
            switch ( input.LA(1) ) {
            case AND:
            case OR:
                {
                alt20=1;
                }
                break;
            case EQ:
            case LT:
            case GT:
            case NE:
            case LE:
            case GE:
                {
                alt20=2;
                }
                break;
            case PLUS:
            case MINUS:
                {
                alt20=3;
                }
                break;
            case TIMES:
            case DIVIDE:
                {
                alt20=4;
                }
                break;
            case DOT:
                {
                alt20=5;
                }
                break;
            case INVOKE:
                {
                alt20=6;
                }
                break;
            case ID:
                {
                alt20=7;
                }
                break;
            case INTEGER:
                {
                alt20=8;
                }
                break;
            case TRUE:
                {
                alt20=9;
                }
                break;
            case FALSE:
                {
                alt20=10;
                }
                break;
            case NEW:
                {
                alt20=11;
                }
                break;
            case NULL:
                {
                alt20=12;
                }
                break;
            default:
                if (state.backtracking>0) {state.failed=true; return retval;}
                NoViableAltException nvae =
                    new NoViableAltException("", 20, 0, input);

                throw nvae;
            }

            switch (alt20) {
                case 1 :
                    // EvilAST.g:147:6: ^( ( AND | OR ) lexpr= expression rexpr= expression )
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();// EvilAST.g:147:8: ( AND | OR )
                    int alt16=2;
                    int LA16_0 = input.LA(1);

                    if ( (LA16_0==AND) ) {
                        alt16=1;
                    }
                    else if ( (LA16_0==OR) ) {
                        alt16=2;
                    }
                    else {
                        if (state.backtracking>0) {state.failed=true; return retval;}
                        NoViableAltException nvae =
                            new NoViableAltException("", 16, 0, input);

                        throw nvae;
                    }
                    switch (alt16) {
                        case 1 :
                            // EvilAST.g:147:9: AND
                            {
                            _last = (CommonTree)input.LT(1);
                            AND61=(CommonTree)match(input,AND,FOLLOW_AND_in_expression791); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            AND61_tree = (CommonTree)adaptor.dupNode(AND61);

                            root_1 = (CommonTree)adaptor.becomeRoot(AND61_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;
                        case 2 :
                            // EvilAST.g:147:16: OR
                            {
                            _last = (CommonTree)input.LT(1);
                            OR62=(CommonTree)match(input,OR,FOLLOW_OR_in_expression796); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            OR62_tree = (CommonTree)adaptor.dupNode(OR62);

                            root_1 = (CommonTree)adaptor.becomeRoot(OR62_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;

                    }



                    match(input, Token.DOWN, null); if (state.failed) return retval;
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression802);
                    lexpr=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, lexpr.getTree());
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression806);
                    rexpr=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, rexpr.getTree());

                    match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }


                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 2 :
                    // EvilAST.g:148:6: ^( ( EQ | LT | GT | NE | LE | GE ) lexpr= expression rexpr= expression )
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();// EvilAST.g:148:8: ( EQ | LT | GT | NE | LE | GE )
                    int alt17=6;
                    switch ( input.LA(1) ) {
                    case EQ:
                        {
                        alt17=1;
                        }
                        break;
                    case LT:
                        {
                        alt17=2;
                        }
                        break;
                    case GT:
                        {
                        alt17=3;
                        }
                        break;
                    case NE:
                        {
                        alt17=4;
                        }
                        break;
                    case LE:
                        {
                        alt17=5;
                        }
                        break;
                    case GE:
                        {
                        alt17=6;
                        }
                        break;
                    default:
                        if (state.backtracking>0) {state.failed=true; return retval;}
                        NoViableAltException nvae =
                            new NoViableAltException("", 17, 0, input);

                        throw nvae;
                    }

                    switch (alt17) {
                        case 1 :
                            // EvilAST.g:148:9: EQ
                            {
                            _last = (CommonTree)input.LT(1);
                            EQ63=(CommonTree)match(input,EQ,FOLLOW_EQ_in_expression816); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            EQ63_tree = (CommonTree)adaptor.dupNode(EQ63);

                            root_1 = (CommonTree)adaptor.becomeRoot(EQ63_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;
                        case 2 :
                            // EvilAST.g:148:15: LT
                            {
                            _last = (CommonTree)input.LT(1);
                            LT64=(CommonTree)match(input,LT,FOLLOW_LT_in_expression821); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            LT64_tree = (CommonTree)adaptor.dupNode(LT64);

                            root_1 = (CommonTree)adaptor.becomeRoot(LT64_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;
                        case 3 :
                            // EvilAST.g:148:21: GT
                            {
                            _last = (CommonTree)input.LT(1);
                            GT65=(CommonTree)match(input,GT,FOLLOW_GT_in_expression826); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            GT65_tree = (CommonTree)adaptor.dupNode(GT65);

                            root_1 = (CommonTree)adaptor.becomeRoot(GT65_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;
                        case 4 :
                            // EvilAST.g:148:27: NE
                            {
                            _last = (CommonTree)input.LT(1);
                            NE66=(CommonTree)match(input,NE,FOLLOW_NE_in_expression831); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            NE66_tree = (CommonTree)adaptor.dupNode(NE66);

                            root_1 = (CommonTree)adaptor.becomeRoot(NE66_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;
                        case 5 :
                            // EvilAST.g:148:33: LE
                            {
                            _last = (CommonTree)input.LT(1);
                            LE67=(CommonTree)match(input,LE,FOLLOW_LE_in_expression836); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            LE67_tree = (CommonTree)adaptor.dupNode(LE67);

                            root_1 = (CommonTree)adaptor.becomeRoot(LE67_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;
                        case 6 :
                            // EvilAST.g:148:39: GE
                            {
                            _last = (CommonTree)input.LT(1);
                            GE68=(CommonTree)match(input,GE,FOLLOW_GE_in_expression841); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            GE68_tree = (CommonTree)adaptor.dupNode(GE68);

                            root_1 = (CommonTree)adaptor.becomeRoot(GE68_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;

                    }



                    match(input, Token.DOWN, null); if (state.failed) return retval;
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression847);
                    lexpr=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, lexpr.getTree());
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression851);
                    rexpr=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, rexpr.getTree());

                    match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }


                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 3 :
                    // EvilAST.g:149:6: ^( ( PLUS | MINUS ) lexpr= expression rexpr= expression )
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();// EvilAST.g:149:8: ( PLUS | MINUS )
                    int alt18=2;
                    int LA18_0 = input.LA(1);

                    if ( (LA18_0==PLUS) ) {
                        alt18=1;
                    }
                    else if ( (LA18_0==MINUS) ) {
                        alt18=2;
                    }
                    else {
                        if (state.backtracking>0) {state.failed=true; return retval;}
                        NoViableAltException nvae =
                            new NoViableAltException("", 18, 0, input);

                        throw nvae;
                    }
                    switch (alt18) {
                        case 1 :
                            // EvilAST.g:149:9: PLUS
                            {
                            _last = (CommonTree)input.LT(1);
                            PLUS69=(CommonTree)match(input,PLUS,FOLLOW_PLUS_in_expression861); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            PLUS69_tree = (CommonTree)adaptor.dupNode(PLUS69);

                            root_1 = (CommonTree)adaptor.becomeRoot(PLUS69_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;
                        case 2 :
                            // EvilAST.g:149:17: MINUS
                            {
                            _last = (CommonTree)input.LT(1);
                            MINUS70=(CommonTree)match(input,MINUS,FOLLOW_MINUS_in_expression866); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            MINUS70_tree = (CommonTree)adaptor.dupNode(MINUS70);

                            root_1 = (CommonTree)adaptor.becomeRoot(MINUS70_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;

                    }



                    match(input, Token.DOWN, null); if (state.failed) return retval;
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression872);
                    lexpr=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, lexpr.getTree());
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression876);
                    rexpr=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, rexpr.getTree());

                    match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }


                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 4 :
                    // EvilAST.g:150:6: ^( ( TIMES | DIVIDE ) lexpr= expression rexpr= expression )
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();// EvilAST.g:150:8: ( TIMES | DIVIDE )
                    int alt19=2;
                    int LA19_0 = input.LA(1);

                    if ( (LA19_0==TIMES) ) {
                        alt19=1;
                    }
                    else if ( (LA19_0==DIVIDE) ) {
                        alt19=2;
                    }
                    else {
                        if (state.backtracking>0) {state.failed=true; return retval;}
                        NoViableAltException nvae =
                            new NoViableAltException("", 19, 0, input);

                        throw nvae;
                    }
                    switch (alt19) {
                        case 1 :
                            // EvilAST.g:150:9: TIMES
                            {
                            _last = (CommonTree)input.LT(1);
                            TIMES71=(CommonTree)match(input,TIMES,FOLLOW_TIMES_in_expression886); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            TIMES71_tree = (CommonTree)adaptor.dupNode(TIMES71);

                            root_1 = (CommonTree)adaptor.becomeRoot(TIMES71_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;
                        case 2 :
                            // EvilAST.g:150:18: DIVIDE
                            {
                            _last = (CommonTree)input.LT(1);
                            DIVIDE72=(CommonTree)match(input,DIVIDE,FOLLOW_DIVIDE_in_expression891); if (state.failed) return retval;
                            if ( state.backtracking==0 ) {
                            DIVIDE72_tree = (CommonTree)adaptor.dupNode(DIVIDE72);

                            root_1 = (CommonTree)adaptor.becomeRoot(DIVIDE72_tree, root_1);
                            }

                            if ( state.backtracking==0 ) {
                            }
                            }
                            break;

                    }



                    match(input, Token.DOWN, null); if (state.failed) return retval;
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression897);
                    lexpr=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, lexpr.getTree());
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression901);
                    rexpr=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, rexpr.getTree());

                    match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }


                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 5 :
                    // EvilAST.g:151:6: ^( DOT ID ) expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
                    DOT73=(CommonTree)match(input,DOT,FOLLOW_DOT_in_expression910); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    DOT73_tree = new DottedTree(DOT73);

                    root_1 = (CommonTree)adaptor.becomeRoot(DOT73_tree, root_1);
                    }


                    match(input, Token.DOWN, null); if (state.failed) return retval;
                    _last = (CommonTree)input.LT(1);
                    ID74=(CommonTree)match(input,ID,FOLLOW_ID_in_expression916); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    ID74_tree = (CommonTree)adaptor.dupNode(ID74);

                    adaptor.addChild(root_1, ID74_tree);
                    }

                    match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }

                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_expression_in_expression919);
                    expression75=expression();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_0, expression75.getTree());

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 6 :
                    // EvilAST.g:152:6: ^( INVOKE id= ID args= arguments )
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
                    INVOKE76=(CommonTree)match(input,INVOKE,FOLLOW_INVOKE_in_expression928); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    INVOKE76_tree = (CommonTree)adaptor.dupNode(INVOKE76);

                    root_1 = (CommonTree)adaptor.becomeRoot(INVOKE76_tree, root_1);
                    }


                    match(input, Token.DOWN, null); if (state.failed) return retval;
                    _last = (CommonTree)input.LT(1);
                    id=(CommonTree)match(input,ID,FOLLOW_ID_in_expression932); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    id_tree = (CommonTree)adaptor.dupNode(id);

                    adaptor.addChild(root_1, id_tree);
                    }
                    _last = (CommonTree)input.LT(1);
                    pushFollow(FOLLOW_arguments_in_expression936);
                    args=arguments();

                    state._fsp--;
                    if (state.failed) return retval;
                    if ( state.backtracking==0 ) 
                    adaptor.addChild(root_1, args.getTree());

                    match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }


                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 7 :
                    // EvilAST.g:153:6: ID
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    ID77=(CommonTree)match(input,ID,FOLLOW_ID_in_expression944); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    ID77_tree = (CommonTree)adaptor.dupNode(ID77);

                    adaptor.addChild(root_0, ID77_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 8 :
                    // EvilAST.g:154:6: INTEGER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    INTEGER78=(CommonTree)match(input,INTEGER,FOLLOW_INTEGER_in_expression951); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    INTEGER78_tree = (CommonTree)adaptor.dupNode(INTEGER78);

                    adaptor.addChild(root_0, INTEGER78_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 9 :
                    // EvilAST.g:155:6: TRUE
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    TRUE79=(CommonTree)match(input,TRUE,FOLLOW_TRUE_in_expression958); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    TRUE79_tree = (CommonTree)adaptor.dupNode(TRUE79);

                    adaptor.addChild(root_0, TRUE79_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 10 :
                    // EvilAST.g:156:6: FALSE
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    FALSE80=(CommonTree)match(input,FALSE,FOLLOW_FALSE_in_expression965); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    FALSE80_tree = (CommonTree)adaptor.dupNode(FALSE80);

                    adaptor.addChild(root_0, FALSE80_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 11 :
                    // EvilAST.g:157:6: NEW ID
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    NEW81=(CommonTree)match(input,NEW,FOLLOW_NEW_in_expression972); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    NEW81_tree = (CommonTree)adaptor.dupNode(NEW81);

                    root_0 = (CommonTree)adaptor.becomeRoot(NEW81_tree, root_0);
                    }
                    _last = (CommonTree)input.LT(1);
                    ID82=(CommonTree)match(input,ID,FOLLOW_ID_in_expression975); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    ID82_tree = (CommonTree)adaptor.dupNode(ID82);

                    adaptor.addChild(root_0, ID82_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 12 :
                    // EvilAST.g:158:6: NULL
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    NULL83=(CommonTree)match(input,NULL,FOLLOW_NULL_in_expression982); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    NULL83_tree = (CommonTree)adaptor.dupNode(NULL83);

                    adaptor.addChild(root_0, NULL83_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }
            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "expression"

    public static class arguments_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "arguments"
    // EvilAST.g:161:1: arguments : arg_list ;
    public final EvilAST.arguments_return arguments() throws RecognitionException {
        EvilAST.arguments_return retval = new EvilAST.arguments_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        EvilAST.arg_list_return arg_list84 = null;



        try {
            // EvilAST.g:162:4: ( arg_list )
            // EvilAST.g:162:6: arg_list
            {
            root_0 = (CommonTree)adaptor.nil();

            _last = (CommonTree)input.LT(1);
            pushFollow(FOLLOW_arg_list_in_arguments997);
            arg_list84=arg_list();

            state._fsp--;
            if (state.failed) return retval;
            if ( state.backtracking==0 ) 
            adaptor.addChild(root_0, arg_list84.getTree());

            if ( state.backtracking==0 ) {
            }
            }

            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "arguments"

    public static class arg_list_return extends TreeRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start "arg_list"
    // EvilAST.g:165:1: arg_list : ( ^( ARGS ( expression )+ ) | ARGS );
    public final EvilAST.arg_list_return arg_list() throws RecognitionException {
        EvilAST.arg_list_return retval = new EvilAST.arg_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        CommonTree _first_0 = null;
        CommonTree _last = null;

        CommonTree ARGS85=null;
        CommonTree ARGS87=null;
        EvilAST.expression_return expression86 = null;


        CommonTree ARGS85_tree=null;
        CommonTree ARGS87_tree=null;

        try {
            // EvilAST.g:166:4: ( ^( ARGS ( expression )+ ) | ARGS )
            int alt22=2;
            int LA22_0 = input.LA(1);

            if ( (LA22_0==ARGS) ) {
                int LA22_1 = input.LA(2);

                if ( (LA22_1==DOWN) ) {
                    alt22=1;
                }
                else if ( (LA22_1==UP) ) {
                    alt22=2;
                }
                else {
                    if (state.backtracking>0) {state.failed=true; return retval;}
                    NoViableAltException nvae =
                        new NoViableAltException("", 22, 1, input);

                    throw nvae;
                }
            }
            else {
                if (state.backtracking>0) {state.failed=true; return retval;}
                NoViableAltException nvae =
                    new NoViableAltException("", 22, 0, input);

                throw nvae;
            }
            switch (alt22) {
                case 1 :
                    // EvilAST.g:166:6: ^( ARGS ( expression )+ )
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    {
                    CommonTree _save_last_1 = _last;
                    CommonTree _first_1 = null;
                    CommonTree root_1 = (CommonTree)adaptor.nil();_last = (CommonTree)input.LT(1);
                    ARGS85=(CommonTree)match(input,ARGS,FOLLOW_ARGS_in_arg_list1013); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    ARGS85_tree = (CommonTree)adaptor.dupNode(ARGS85);

                    root_1 = (CommonTree)adaptor.becomeRoot(ARGS85_tree, root_1);
                    }


                    match(input, Token.DOWN, null); if (state.failed) return retval;
                    // EvilAST.g:166:13: ( expression )+
                    int cnt21=0;
                    loop21:
                    do {
                        int alt21=2;
                        int LA21_0 = input.LA(1);

                        if ( ((LA21_0>=TRUE && LA21_0<=NULL)||LA21_0==INVOKE||(LA21_0>=DOT && LA21_0<=DIVIDE)||(LA21_0>=ID && LA21_0<=INTEGER)) ) {
                            alt21=1;
                        }


                        switch (alt21) {
                    	case 1 :
                    	    // EvilAST.g:0:0: expression
                    	    {
                    	    _last = (CommonTree)input.LT(1);
                    	    pushFollow(FOLLOW_expression_in_arg_list1015);
                    	    expression86=expression();

                    	    state._fsp--;
                    	    if (state.failed) return retval;
                    	    if ( state.backtracking==0 ) 
                    	    adaptor.addChild(root_1, expression86.getTree());

                    	    if ( state.backtracking==0 ) {
                    	    }
                    	    }
                    	    break;

                    	default :
                    	    if ( cnt21 >= 1 ) break loop21;
                    	    if (state.backtracking>0) {state.failed=true; return retval;}
                                EarlyExitException eee =
                                    new EarlyExitException(21, input);
                                throw eee;
                        }
                        cnt21++;
                    } while (true);


                    match(input, Token.UP, null); if (state.failed) return retval;adaptor.addChild(root_0, root_1);_last = _save_last_1;
                    }


                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;
                case 2 :
                    // EvilAST.g:167:6: ARGS
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    _last = (CommonTree)input.LT(1);
                    ARGS87=(CommonTree)match(input,ARGS,FOLLOW_ARGS_in_arg_list1024); if (state.failed) return retval;
                    if ( state.backtracking==0 ) {
                    ARGS87_tree = (CommonTree)adaptor.dupNode(ARGS87);

                    adaptor.addChild(root_0, ARGS87_tree);
                    }

                    if ( state.backtracking==0 ) {
                    }
                    }
                    break;

            }
            if ( state.backtracking==0 ) {

            retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return retval;
    }
    // $ANTLR end "arg_list"

    // $ANTLR start synpred21_EvilAST
    public final void synpred21_EvilAST_fragment() throws RecognitionException {   
        // EvilAST.g:123:28: ( block )
        // EvilAST.g:123:28: block
        {
        pushFollow(FOLLOW_block_in_synpred21_EvilAST653);
        block();

        state._fsp--;
        if (state.failed) return ;

        }
    }
    // $ANTLR end synpred21_EvilAST

    // $ANTLR start synpred22_EvilAST
    public final void synpred22_EvilAST_fragment() throws RecognitionException {   
        // EvilAST.g:135:15: ( expression )
        // EvilAST.g:135:15: expression
        {
        pushFollow(FOLLOW_expression_in_synpred22_EvilAST721);
        expression();

        state._fsp--;
        if (state.failed) return ;

        }
    }
    // $ANTLR end synpred22_EvilAST

    // Delegated rules

    public final boolean synpred22_EvilAST() {
        state.backtracking++;
        int start = input.mark();
        try {
            synpred22_EvilAST_fragment(); // can never throw exception
        } catch (RecognitionException re) {
            System.err.println("impossible: "+re);
        }
        boolean success = !state.failed;
        input.rewind(start);
        state.backtracking--;
        state.failed=false;
        return success;
    }
    public final boolean synpred21_EvilAST() {
        state.backtracking++;
        int start = input.mark();
        try {
            synpred21_EvilAST_fragment(); // can never throw exception
        } catch (RecognitionException re) {
            System.err.println("impossible: "+re);
        }
        boolean success = !state.failed;
        input.rewind(start);
        state.backtracking--;
        state.failed=false;
        return success;
    }


    protected DFA13 dfa13 = new DFA13(this);
    protected DFA14 dfa14 = new DFA14(this);
    static final String DFA13_eotS =
        "\15\uffff";
    static final String DFA13_eofS =
        "\1\2\14\uffff";
    static final String DFA13_minS =
        "\1\3\1\0\13\uffff";
    static final String DFA13_maxS =
        "\1\51\1\0\13\uffff";
    static final String DFA13_acceptS =
        "\2\uffff\1\2\11\uffff\1\1";
    static final String DFA13_specialS =
        "\1\uffff\1\0\13\uffff}>";
    static final String[] DFA13_transitionS = {
            "\1\2\5\uffff\1\2\1\uffff\2\2\1\uffff\3\2\15\uffff\1\1\1\uffff"+
            "\1\2\10\uffff\1\2",
            "\1\uffff",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA13_eot = DFA.unpackEncodedString(DFA13_eotS);
    static final short[] DFA13_eof = DFA.unpackEncodedString(DFA13_eofS);
    static final char[] DFA13_min = DFA.unpackEncodedStringToUnsignedChars(DFA13_minS);
    static final char[] DFA13_max = DFA.unpackEncodedStringToUnsignedChars(DFA13_maxS);
    static final short[] DFA13_accept = DFA.unpackEncodedString(DFA13_acceptS);
    static final short[] DFA13_special = DFA.unpackEncodedString(DFA13_specialS);
    static final short[][] DFA13_transition;

    static {
        int numStates = DFA13_transitionS.length;
        DFA13_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA13_transition[i] = DFA.unpackEncodedString(DFA13_transitionS[i]);
        }
    }

    class DFA13 extends DFA {

        public DFA13(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 13;
            this.eot = DFA13_eot;
            this.eof = DFA13_eof;
            this.min = DFA13_min;
            this.max = DFA13_max;
            this.accept = DFA13_accept;
            this.special = DFA13_special;
            this.transition = DFA13_transition;
        }
        public String getDescription() {
            return "123:27: ( block )?";
        }
        public int specialStateTransition(int s, IntStream _input) throws NoViableAltException {
            TreeNodeStream input = (TreeNodeStream)_input;
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        int LA13_1 = input.LA(1);

                         
                        int index13_1 = input.index();
                        input.rewind();
                        s = -1;
                        if ( (synpred21_EvilAST()) ) {s = 12;}

                        else if ( (true) ) {s = 2;}

                         
                        input.seek(index13_1);
                        if ( s>=0 ) return s;
                        break;
            }
            if (state.backtracking>0) {state.failed=true; return -1;}
            NoViableAltException nvae =
                new NoViableAltException(getDescription(), 13, _s, input);
            error(nvae);
            throw nvae;
        }
    }
    static final String DFA14_eotS =
        "\37\uffff";
    static final String DFA14_eofS =
        "\1\25\36\uffff";
    static final String DFA14_minS =
        "\1\3\15\uffff\1\0\20\uffff";
    static final String DFA14_maxS =
        "\1\71\15\uffff\1\0\20\uffff";
    static final String DFA14_acceptS =
        "\1\uffff\1\1\23\uffff\1\2\11\uffff";
    static final String DFA14_specialS =
        "\16\uffff\1\0\20\uffff}>";
    static final String[] DFA14_transitionS = {
            "\1\25\5\uffff\1\25\1\uffff\2\25\1\uffff\3\25\4\1\11\uffff\1"+
            "\25\1\uffff\1\16\10\uffff\1\25\15\1\1\uffff\2\1",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "\1\uffff",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
    };

    static final short[] DFA14_eot = DFA.unpackEncodedString(DFA14_eotS);
    static final short[] DFA14_eof = DFA.unpackEncodedString(DFA14_eofS);
    static final char[] DFA14_min = DFA.unpackEncodedStringToUnsignedChars(DFA14_minS);
    static final char[] DFA14_max = DFA.unpackEncodedStringToUnsignedChars(DFA14_maxS);
    static final short[] DFA14_accept = DFA.unpackEncodedString(DFA14_acceptS);
    static final short[] DFA14_special = DFA.unpackEncodedString(DFA14_specialS);
    static final short[][] DFA14_transition;

    static {
        int numStates = DFA14_transitionS.length;
        DFA14_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA14_transition[i] = DFA.unpackEncodedString(DFA14_transitionS[i]);
        }
    }

    class DFA14 extends DFA {

        public DFA14(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 14;
            this.eot = DFA14_eot;
            this.eof = DFA14_eof;
            this.min = DFA14_min;
            this.max = DFA14_max;
            this.accept = DFA14_accept;
            this.special = DFA14_special;
            this.transition = DFA14_transition;
        }
        public String getDescription() {
            return "135:14: ( expression )?";
        }
        public int specialStateTransition(int s, IntStream _input) throws NoViableAltException {
            TreeNodeStream input = (TreeNodeStream)_input;
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        int LA14_14 = input.LA(1);

                         
                        int index14_14 = input.index();
                        input.rewind();
                        s = -1;
                        if ( (synpred22_EvilAST()) ) {s = 1;}

                        else if ( (true) ) {s = 21;}

                         
                        input.seek(index14_14);
                        if ( s>=0 ) return s;
                        break;
            }
            if (state.backtracking>0) {state.failed=true; return -1;}
            NoViableAltException nvae =
                new NoViableAltException(getDescription(), 14, _s, input);
            error(nvae);
            throw nvae;
        }
    }
 

    public static final BitSet FOLLOW_PROGRAM_in_program66 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_types_in_program70 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_declarations_in_program74 = new BitSet(new long[]{0x0000000002000000L});
    public static final BitSet FOLLOW_functions_in_program78 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_TYPES_in_types97 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_sub_in_types99 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_TYPES_in_types109 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_type_declaration_in_type_sub124 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_type_sub_in_type_sub126 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRUCT_in_type_declaration150 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_type_declaration154 = new BitSet(new long[]{0x0000000004000000L});
    public static final BitSet FOLLOW_nested_decl_in_type_declaration156 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_decl_in_nested_decl174 = new BitSet(new long[]{0x0000000004000002L});
    public static final BitSet FOLLOW_DECL_in_decl191 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_decl194 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_in_decl198 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_decl203 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_INT_in_type223 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BOOL_in_type232 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRUCT_in_type242 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_type246 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DECLS_in_declarations272 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_declaration_in_declarations274 = new BitSet(new long[]{0x0000000008000008L});
    public static final BitSet FOLLOW_DECLLIST_in_declaration292 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_declaration295 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_in_declaration299 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_id_list_in_declaration302 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_id_list321 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_id_list_in_id_list323 = new BitSet(new long[]{0x0100000000000008L});
    public static final BitSet FOLLOW_FUNCS_in_functions344 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_function_in_functions346 = new BitSet(new long[]{0x0000000000000088L});
    public static final BitSet FOLLOW_FUN_in_function364 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_function371 = new BitSet(new long[]{0x0000000010000000L});
    public static final BitSet FOLLOW_parameters_in_function375 = new BitSet(new long[]{0x0000000020000000L});
    public static final BitSet FOLLOW_RETTYPE_in_function384 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_return_type_in_function388 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_declarations_in_function393 = new BitSet(new long[]{0x0000000080000000L});
    public static final BitSet FOLLOW_statement_list_in_function397 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PARAMS_in_parameters421 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_decl_in_parameters423 = new BitSet(new long[]{0x0000000004000008L});
    public static final BitSet FOLLOW_type_in_return_type440 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_VOID_in_return_type447 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_block_in_statement462 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_assignment_in_statement469 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_print_in_statement476 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_read_in_statement483 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_conditional_in_statement490 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_loop_in_statement497 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_delete_in_statement504 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ret_in_statement511 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_invocation_in_statement518 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BLOCK_in_block534 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_statement_list_in_block536 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_STMTS_in_statement_list553 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_statement_in_statement_list555 = new BitSet(new long[]{0x000002014001DA08L});
    public static final BitSet FOLLOW_ASSIGN_in_assignment573 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_assignment577 = new BitSet(new long[]{0x0100000000000000L});
    public static final BitSet FOLLOW_lvalue_in_assignment581 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PRINT_in_print604 = new BitSet(new long[]{0x037FFC01001E0000L});
    public static final BitSet FOLLOW_expression_in_print607 = new BitSet(new long[]{0x0000000000000402L});
    public static final BitSet FOLLOW_ENDL_in_print610 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_READ_in_read627 = new BitSet(new long[]{0x0100000000000000L});
    public static final BitSet FOLLOW_lvalue_in_read630 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IF_in_conditional645 = new BitSet(new long[]{0x037FFC01001E0000L});
    public static final BitSet FOLLOW_expression_in_conditional648 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_block_in_conditional650 = new BitSet(new long[]{0x0000000040000002L});
    public static final BitSet FOLLOW_block_in_conditional653 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_WHILE_in_loop671 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_loop675 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_block_in_loop679 = new BitSet(new long[]{0x037FFC01001E0000L});
    public static final BitSet FOLLOW_expression_in_loop683 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DELETE_in_delete699 = new BitSet(new long[]{0x037FFC01001E0000L});
    public static final BitSet FOLLOW_expression_in_delete702 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RETURN_in_ret717 = new BitSet(new long[]{0x037FFC01001E0002L});
    public static final BitSet FOLLOW_expression_in_ret721 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INVOKE_in_invocation739 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_invocation743 = new BitSet(new long[]{0x0000000200000000L});
    public static final BitSet FOLLOW_arguments_in_invocation747 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_lvalue763 = new BitSet(new long[]{0x0000040000000002L});
    public static final BitSet FOLLOW_DOT_in_lvalue766 = new BitSet(new long[]{0x0100000000000000L});
    public static final BitSet FOLLOW_ID_in_lvalue772 = new BitSet(new long[]{0x0000040000000002L});
    public static final BitSet FOLLOW_AND_in_expression791 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_OR_in_expression796 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression802 = new BitSet(new long[]{0x037FFC01001E0000L});
    public static final BitSet FOLLOW_expression_in_expression806 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_EQ_in_expression816 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_LT_in_expression821 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_GT_in_expression826 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_NE_in_expression831 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_LE_in_expression836 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_GE_in_expression841 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression847 = new BitSet(new long[]{0x037FFC01001E0000L});
    public static final BitSet FOLLOW_expression_in_expression851 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PLUS_in_expression861 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_MINUS_in_expression866 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression872 = new BitSet(new long[]{0x037FFC01001E0000L});
    public static final BitSet FOLLOW_expression_in_expression876 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_TIMES_in_expression886 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_DIVIDE_in_expression891 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression897 = new BitSet(new long[]{0x037FFC01001E0000L});
    public static final BitSet FOLLOW_expression_in_expression901 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DOT_in_expression910 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_expression916 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_expression_in_expression919 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INVOKE_in_expression928 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_expression932 = new BitSet(new long[]{0x0000000200000000L});
    public static final BitSet FOLLOW_arguments_in_expression936 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_expression944 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INTEGER_in_expression951 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_TRUE_in_expression958 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FALSE_in_expression965 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NEW_in_expression972 = new BitSet(new long[]{0x0100000000000000L});
    public static final BitSet FOLLOW_ID_in_expression975 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NULL_in_expression982 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_arg_list_in_arguments997 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ARGS_in_arg_list1013 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_arg_list1015 = new BitSet(new long[]{0x037FFC01001E0008L});
    public static final BitSet FOLLOW_ARGS_in_arg_list1024 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_block_in_synpred21_EvilAST653 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_synpred22_EvilAST721 = new BitSet(new long[]{0x0000000000000002L});

}