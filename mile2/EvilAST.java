// $ANTLR 3.1.3 Mar 18, 2009 10:09:25 EvilAST.g 2010-04-15 00:07:23

import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

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
        

    public String[] getTokenNames() { return EvilAST.tokenNames; }
    public String getGrammarFileName() { return "EvilAST.g"; }



    // $ANTLR start "program"
    // EvilAST.g:9:1: program[StructTable structTable, SymTable symtable, FunTable funtable] : ^( PROGRAM types[structTable, symtable] declarations[symtable] functions[structTable, symtable, funtable] ) ;
    public final void program(StructTable structTable, SymTable symtable, FunTable funtable) throws RecognitionException {
        try {
            // EvilAST.g:10:4: ( ^( PROGRAM types[structTable, symtable] declarations[symtable] functions[structTable, symtable, funtable] ) )
            // EvilAST.g:10:6: ^( PROGRAM types[structTable, symtable] declarations[symtable] functions[structTable, symtable, funtable] )
            {
            match(input,PROGRAM,FOLLOW_PROGRAM_in_program50); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_types_in_program52);
            types(structTable, symtable);

            state._fsp--;

            pushFollow(FOLLOW_declarations_in_program55);
            declarations(symtable);

            state._fsp--;

            pushFollow(FOLLOW_functions_in_program64);
            functions(structTable, symtable, funtable);

            state._fsp--;


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "program"


    // $ANTLR start "types"
    // EvilAST.g:14:1: types[StructTable structTable, SymTable symtable] : ( ^( TYPES type_sub[structTable, symtable] ) | TYPES );
    public final void types(StructTable structTable, SymTable symtable) throws RecognitionException {
        try {
            // EvilAST.g:15:3: ( ^( TYPES type_sub[structTable, symtable] ) | TYPES )
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
                    NoViableAltException nvae =
                        new NoViableAltException("", 1, 1, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // EvilAST.g:15:5: ^( TYPES type_sub[structTable, symtable] )
                    {
                    match(input,TYPES,FOLLOW_TYPES_in_types85); 

                    if ( input.LA(1)==Token.DOWN ) {
                        match(input, Token.DOWN, null); 
                        pushFollow(FOLLOW_type_sub_in_types87);
                        type_sub(structTable, symtable);

                        state._fsp--;


                        match(input, Token.UP, null); 
                    }

                    }
                    break;
                case 2 :
                    // EvilAST.g:16:7: TYPES
                    {
                    match(input,TYPES,FOLLOW_TYPES_in_types97); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "types"


    // $ANTLR start "type_sub"
    // EvilAST.g:19:1: type_sub[StructTable structTable, SymTable symtable] : ( type_declaration[structTable, symtable] type_sub[structTable, symtable] | );
    public final void type_sub(StructTable structTable, SymTable symtable) throws RecognitionException {
        try {
            // EvilAST.g:20:4: ( type_declaration[structTable, symtable] type_sub[structTable, symtable] | )
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==STRUCT) ) {
                alt2=1;
            }
            else if ( (LA2_0==UP) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // EvilAST.g:20:6: type_declaration[structTable, symtable] type_sub[structTable, symtable]
                    {
                    pushFollow(FOLLOW_type_declaration_in_type_sub113);
                    type_declaration(structTable, symtable);

                    state._fsp--;

                    pushFollow(FOLLOW_type_sub_in_type_sub116);
                    type_sub(structTable, symtable);

                    state._fsp--;


                    }
                    break;
                case 2 :
                    // EvilAST.g:22:4: 
                    {
                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "type_sub"


    // $ANTLR start "type_declaration"
    // EvilAST.g:24:1: type_declaration[StructTable structTable, SymTable symtable] : ^( STRUCT id= ID structSymTable= nested_decl[symtable] ) ;
    public final void type_declaration(StructTable structTable, SymTable symtable) throws RecognitionException {
        CommonTree id=null;
        SymTable structSymTable = null;


        try {
            // EvilAST.g:25:4: ( ^( STRUCT id= ID structSymTable= nested_decl[symtable] ) )
            // EvilAST.g:25:6: ^( STRUCT id= ID structSymTable= nested_decl[symtable] )
            {
            match(input,STRUCT,FOLLOW_STRUCT_in_type_declaration143); 

            match(input, Token.DOWN, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_type_declaration147); 
             structTable.addStruct((id!=null?id.getText():null)); 
            pushFollow(FOLLOW_nested_decl_in_type_declaration166);
            structSymTable=nested_decl(symtable);

            state._fsp--;


            match(input, Token.UP, null); 
             structTable.updateStruct((id!=null?id.getText():null), structSymTable); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "type_declaration"


    // $ANTLR start "nested_decl"
    // EvilAST.g:31:1: nested_decl[SymTable symtable] returns [SymTable subtable = new SymTable()] : ( decl[symtable, subtable] )+ ;
    public final SymTable nested_decl(SymTable symtable) throws RecognitionException {
        SymTable subtable =  new SymTable();

        try {
            // EvilAST.g:32:3: ( ( decl[symtable, subtable] )+ )
            // EvilAST.g:32:5: ( decl[symtable, subtable] )+
            {
            // EvilAST.g:32:5: ( decl[symtable, subtable] )+
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
            	    // EvilAST.g:32:5: decl[symtable, subtable]
            	    {
            	    pushFollow(FOLLOW_decl_in_nested_decl199);
            	    decl(symtable, subtable);

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    if ( cnt3 >= 1 ) break loop3;
                        EarlyExitException eee =
                            new EarlyExitException(3, input);
                        throw eee;
                }
                cnt3++;
            } while (true);


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return subtable;
    }
    // $ANTLR end "nested_decl"


    // $ANTLR start "decl"
    // EvilAST.g:35:1: decl[SymTable symtable, SymTable subtable] : ^( DECL ^( TYPE t= type[symtable] ) id= ID ) ;
    public final void decl(SymTable symtable, SymTable subtable) throws RecognitionException {
        CommonTree id=null;
        String t = null;


        try {
            // EvilAST.g:36:4: ( ^( DECL ^( TYPE t= type[symtable] ) id= ID ) )
            // EvilAST.g:36:6: ^( DECL ^( TYPE t= type[symtable] ) id= ID )
            {
            match(input,DECL,FOLLOW_DECL_in_decl218); 

            match(input, Token.DOWN, null); 
            match(input,TYPE,FOLLOW_TYPE_in_decl221); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_type_in_decl225);
            t=type(symtable);

            state._fsp--;


            match(input, Token.UP, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_decl231); 

            match(input, Token.UP, null); 
             subtable.insertSymbol((id!=null?id.getText():null), t); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "decl"


    // $ANTLR start "type"
    // EvilAST.g:41:1: type[SymTable symtable] returns [String t = null] : ( INT | BOOL | ^( STRUCT id= ID ) );
    public final String type(SymTable symtable) throws RecognitionException {
        String t =  null;

        CommonTree id=null;

        try {
            // EvilAST.g:42:3: ( INT | BOOL | ^( STRUCT id= ID ) )
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
                NoViableAltException nvae =
                    new NoViableAltException("", 4, 0, input);

                throw nvae;
            }

            switch (alt4) {
                case 1 :
                    // EvilAST.g:42:6: INT
                    {
                    match(input,INT,FOLLOW_INT_in_type261); 
                     t = SymTable.intType(); 

                    }
                    break;
                case 2 :
                    // EvilAST.g:43:6: BOOL
                    {
                    match(input,BOOL,FOLLOW_BOOL_in_type270); 
                     t = SymTable.boolType(); 

                    }
                    break;
                case 3 :
                    // EvilAST.g:44:6: ^( STRUCT id= ID )
                    {
                    match(input,STRUCT,FOLLOW_STRUCT_in_type280); 

                    match(input, Token.DOWN, null); 
                    id=(CommonTree)match(input,ID,FOLLOW_ID_in_type284); 

                    match(input, Token.UP, null); 

                            if (!symtable.isDefined((id!=null?id.getText():null)))
                            {
                              System.err.println("line " + (id!=null?id.getLine():0) + ": undefined struct type '" + id + "'");
                            }
                            t = SymTable.structType((id!=null?id.getText():null));
                         

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return t;
    }
    // $ANTLR end "type"


    // $ANTLR start "declarations"
    // EvilAST.g:54:1: declarations[SymTable symtable] : ^( DECLS ( declaration[symtable] )* ) ;
    public final void declarations(SymTable symtable) throws RecognitionException {
        try {
            // EvilAST.g:55:4: ( ^( DECLS ( declaration[symtable] )* ) )
            // EvilAST.g:55:6: ^( DECLS ( declaration[symtable] )* )
            {
            match(input,DECLS,FOLLOW_DECLS_in_declarations309); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // EvilAST.g:55:14: ( declaration[symtable] )*
                loop5:
                do {
                    int alt5=2;
                    int LA5_0 = input.LA(1);

                    if ( (LA5_0==DECLLIST) ) {
                        alt5=1;
                    }


                    switch (alt5) {
                	case 1 :
                	    // EvilAST.g:55:14: declaration[symtable]
                	    {
                	    pushFollow(FOLLOW_declaration_in_declarations311);
                	    declaration(symtable);

                	    state._fsp--;


                	    }
                	    break;

                	default :
                	    break loop5;
                    }
                } while (true);


                match(input, Token.UP, null); 
            }

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "declarations"


    // $ANTLR start "declaration"
    // EvilAST.g:58:1: declaration[SymTable symtable] : ^( DECLLIST ^( TYPE t= type[symtable] ) id_list[symtable, t] ) ;
    public final void declaration(SymTable symtable) throws RecognitionException {
        String t = null;


        try {
            // EvilAST.g:59:4: ( ^( DECLLIST ^( TYPE t= type[symtable] ) id_list[symtable, t] ) )
            // EvilAST.g:59:8: ^( DECLLIST ^( TYPE t= type[symtable] ) id_list[symtable, t] )
            {
            match(input,DECLLIST,FOLLOW_DECLLIST_in_declaration334); 

            match(input, Token.DOWN, null); 
            match(input,TYPE,FOLLOW_TYPE_in_declaration337); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_type_in_declaration341);
            t=type(symtable);

            state._fsp--;


            match(input, Token.UP, null); 
            pushFollow(FOLLOW_id_list_in_declaration345);
            id_list(symtable, t);

            state._fsp--;


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "declaration"


    // $ANTLR start "id_list"
    // EvilAST.g:62:1: id_list[SymTable symtable, String t] : ( list_id[symtable, t] )+ ;
    public final void id_list(SymTable symtable, String t) throws RecognitionException {
        try {
            // EvilAST.g:63:4: ( ( list_id[symtable, t] )+ )
            // EvilAST.g:63:8: ( list_id[symtable, t] )+
            {
            // EvilAST.g:63:8: ( list_id[symtable, t] )+
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
            	    // EvilAST.g:63:8: list_id[symtable, t]
            	    {
            	    pushFollow(FOLLOW_list_id_in_id_list366);
            	    list_id(symtable, t);

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    if ( cnt6 >= 1 ) break loop6;
                        EarlyExitException eee =
                            new EarlyExitException(6, input);
                        throw eee;
                }
                cnt6++;
            } while (true);


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "id_list"


    // $ANTLR start "list_id"
    // EvilAST.g:66:1: list_id[SymTable symtable, String t] : id= ID ;
    public final void list_id(SymTable symtable, String t) throws RecognitionException {
        CommonTree id=null;

        try {
            // EvilAST.g:67:4: (id= ID )
            // EvilAST.g:67:6: id= ID
            {
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_list_id390); 
              if (!symtable.isDefined((id!=null?id.getText():null)))
                     {
                        symtable.insertSymbol((id!=null?id.getText():null), t);
                     }
                     else
                     {
                        System.err.println("line " + (id!=null?id.getLine():0) + ": already declared '" + id + "'");
                     }
                  

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "list_id"


    // $ANTLR start "functions"
    // EvilAST.g:81:1: functions[StructTable structTable, SymTable symtable, FunTable funtable] : ^( FUNCS ( function[structTable, symtable, funtable] )* ) ;
    public final void functions(StructTable structTable, SymTable symtable, FunTable funtable) throws RecognitionException {
        try {
            // EvilAST.g:82:4: ( ^( FUNCS ( function[structTable, symtable, funtable] )* ) )
            // EvilAST.g:82:6: ^( FUNCS ( function[structTable, symtable, funtable] )* )
            {
            match(input,FUNCS,FOLLOW_FUNCS_in_functions418); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // EvilAST.g:82:14: ( function[structTable, symtable, funtable] )*
                loop7:
                do {
                    int alt7=2;
                    int LA7_0 = input.LA(1);

                    if ( (LA7_0==FUN) ) {
                        alt7=1;
                    }


                    switch (alt7) {
                	case 1 :
                	    // EvilAST.g:82:14: function[structTable, symtable, funtable]
                	    {
                	    pushFollow(FOLLOW_function_in_functions420);
                	    function(structTable, symtable, funtable);

                	    state._fsp--;


                	    }
                	    break;

                	default :
                	    break loop7;
                    }
                } while (true);


                match(input, Token.UP, null); 
            }

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "functions"


    // $ANTLR start "function"
    // EvilAST.g:85:1: function[StructTable structTable, SymTable symtable, FunTable funtable] : ^( FUN id= ID parameters[symtable, locals] ^( RETTYPE retType= return_type[symtable] ) declarations[locals] statement[symtable, structTable] ) ;
    public final void function(StructTable structTable, SymTable symtable, FunTable funtable) throws RecognitionException {
        CommonTree id=null;
        String retType = null;


        try {
            // EvilAST.g:86:4: ( ^( FUN id= ID parameters[symtable, locals] ^( RETTYPE retType= return_type[symtable] ) declarations[locals] statement[symtable, structTable] ) )
            // EvilAST.g:86:6: ^( FUN id= ID parameters[symtable, locals] ^( RETTYPE retType= return_type[symtable] ) declarations[locals] statement[symtable, structTable] )
            {
            match(input,FUN,FOLLOW_FUN_in_function441); 

            match(input, Token.DOWN, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_function445); 

                    if (symtable.isDefined((id!=null?id.getText():null)) || funtable.isDefined((id!=null?id.getText():null)))
                    {
                       System.err.println("line " + (id!=null?id.getLine():0) + ": symbol '" + id + "' already defined");
                    }
                    SymTable locals = new SymTable();
                 	
            pushFollow(FOLLOW_parameters_in_function461);
            parameters(symtable, locals);

            state._fsp--;

            match(input,RETTYPE,FOLLOW_RETTYPE_in_function472); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_return_type_in_function476);
            retType=return_type(symtable);

            state._fsp--;


            match(input, Token.UP, null); 
            pushFollow(FOLLOW_declarations_in_function486);
            declarations(locals);

            state._fsp--;

             symtable.insertSymbol((id!=null?id.getText():null), retType); 
            pushFollow(FOLLOW_statement_in_function504);
            statement(symtable, structTable);

            state._fsp--;


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "function"


    // $ANTLR start "parameters"
    // EvilAST.g:101:1: parameters[SymTable symtable, SymTable subtable] : ^( PARAMS ( decl[symtable, subtable] )* ) ;
    public final void parameters(SymTable symtable, SymTable subtable) throws RecognitionException {
        try {
            // EvilAST.g:102:4: ( ^( PARAMS ( decl[symtable, subtable] )* ) )
            // EvilAST.g:102:6: ^( PARAMS ( decl[symtable, subtable] )* )
            {
            match(input,PARAMS,FOLLOW_PARAMS_in_parameters524); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // EvilAST.g:102:15: ( decl[symtable, subtable] )*
                loop8:
                do {
                    int alt8=2;
                    int LA8_0 = input.LA(1);

                    if ( (LA8_0==DECL) ) {
                        alt8=1;
                    }


                    switch (alt8) {
                	case 1 :
                	    // EvilAST.g:102:15: decl[symtable, subtable]
                	    {
                	    pushFollow(FOLLOW_decl_in_parameters526);
                	    decl(symtable, subtable);

                	    state._fsp--;


                	    }
                	    break;

                	default :
                	    break loop8;
                    }
                } while (true);


                match(input, Token.UP, null); 
            }

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "parameters"


    // $ANTLR start "return_type"
    // EvilAST.g:105:1: return_type[SymTable symtable] returns [String t = null] : ( type[symtable] | VOID );
    public final String return_type(SymTable symtable) throws RecognitionException {
        String t =  null;

        try {
            // EvilAST.g:106:4: ( type[symtable] | VOID )
            int alt9=2;
            int LA9_0 = input.LA(1);

            if ( ((LA9_0>=STRUCT && LA9_0<=BOOL)) ) {
                alt9=1;
            }
            else if ( (LA9_0==VOID) ) {
                alt9=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // EvilAST.g:106:6: type[symtable]
                    {
                    pushFollow(FOLLOW_type_in_return_type550);
                    type(symtable);

                    state._fsp--;


                    }
                    break;
                case 2 :
                    // EvilAST.g:107:6: VOID
                    {
                    match(input,VOID,FOLLOW_VOID_in_return_type558); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return t;
    }
    // $ANTLR end "return_type"


    // $ANTLR start "statement"
    // EvilAST.g:110:1: statement[SymTable symtable, StructTable structTable] : ( ^( BLOCK ^( STMTS ( statement[symtable, structTable] )* ) ) | assignment[symtable, structTable] | print | read[symtable, structTable] | ^( IF expression statement[symtable, structTable] ( statement[symtable, structTable] )? ) | ^( WHILE expr= expression b= statement[symtable, structTable] expr2= expression ) | delete | ret | invocation );
    public final void statement(SymTable symtable, StructTable structTable) throws RecognitionException {
        try {
            // EvilAST.g:111:4: ( ^( BLOCK ^( STMTS ( statement[symtable, structTable] )* ) ) | assignment[symtable, structTable] | print | read[symtable, structTable] | ^( IF expression statement[symtable, structTable] ( statement[symtable, structTable] )? ) | ^( WHILE expr= expression b= statement[symtable, structTable] expr2= expression ) | delete | ret | invocation )
            int alt12=9;
            switch ( input.LA(1) ) {
            case BLOCK:
                {
                alt12=1;
                }
                break;
            case ASSIGN:
                {
                alt12=2;
                }
                break;
            case PRINT:
                {
                alt12=3;
                }
                break;
            case READ:
                {
                alt12=4;
                }
                break;
            case IF:
                {
                alt12=5;
                }
                break;
            case WHILE:
                {
                alt12=6;
                }
                break;
            case DELETE:
                {
                alt12=7;
                }
                break;
            case RETURN:
                {
                alt12=8;
                }
                break;
            case INVOKE:
                {
                alt12=9;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 12, 0, input);

                throw nvae;
            }

            switch (alt12) {
                case 1 :
                    // EvilAST.g:111:6: ^( BLOCK ^( STMTS ( statement[symtable, structTable] )* ) )
                    {
                    match(input,BLOCK,FOLLOW_BLOCK_in_statement575); 

                    match(input, Token.DOWN, null); 
                    match(input,STMTS,FOLLOW_STMTS_in_statement578); 

                    if ( input.LA(1)==Token.DOWN ) {
                        match(input, Token.DOWN, null); 
                        // EvilAST.g:111:22: ( statement[symtable, structTable] )*
                        loop10:
                        do {
                            int alt10=2;
                            int LA10_0 = input.LA(1);

                            if ( (LA10_0==PRINT||(LA10_0>=READ && LA10_0<=IF)||(LA10_0>=WHILE && LA10_0<=RETURN)||LA10_0==BLOCK||LA10_0==INVOKE||LA10_0==ASSIGN) ) {
                                alt10=1;
                            }


                            switch (alt10) {
                        	case 1 :
                        	    // EvilAST.g:111:22: statement[symtable, structTable]
                        	    {
                        	    pushFollow(FOLLOW_statement_in_statement580);
                        	    statement(symtable, structTable);

                        	    state._fsp--;


                        	    }
                        	    break;

                        	default :
                        	    break loop10;
                            }
                        } while (true);


                        match(input, Token.UP, null); 
                    }

                    match(input, Token.UP, null); 

                    }
                    break;
                case 2 :
                    // EvilAST.g:112:6: assignment[symtable, structTable]
                    {
                    pushFollow(FOLLOW_assignment_in_statement591);
                    assignment(symtable, structTable);

                    state._fsp--;


                    }
                    break;
                case 3 :
                    // EvilAST.g:113:6: print
                    {
                    pushFollow(FOLLOW_print_in_statement599);
                    print();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    // EvilAST.g:114:6: read[symtable, structTable]
                    {
                    pushFollow(FOLLOW_read_in_statement606);
                    read(symtable, structTable);

                    state._fsp--;


                    }
                    break;
                case 5 :
                    // EvilAST.g:115:6: ^( IF expression statement[symtable, structTable] ( statement[symtable, structTable] )? )
                    {
                    match(input,IF,FOLLOW_IF_in_statement615); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_statement617);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_statement_in_statement619);
                    statement(symtable, structTable);

                    state._fsp--;

                    // EvilAST.g:115:55: ( statement[symtable, structTable] )?
                    int alt11=2;
                    int LA11_0 = input.LA(1);

                    if ( (LA11_0==PRINT||(LA11_0>=READ && LA11_0<=IF)||(LA11_0>=WHILE && LA11_0<=RETURN)||LA11_0==BLOCK||LA11_0==INVOKE||LA11_0==ASSIGN) ) {
                        alt11=1;
                    }
                    switch (alt11) {
                        case 1 :
                            // EvilAST.g:115:56: statement[symtable, structTable]
                            {
                            pushFollow(FOLLOW_statement_in_statement623);
                            statement(symtable, structTable);

                            state._fsp--;


                            }
                            break;

                    }


                    match(input, Token.UP, null); 

                    }
                    break;
                case 6 :
                    // EvilAST.g:116:6: ^( WHILE expr= expression b= statement[symtable, structTable] expr2= expression )
                    {
                    match(input,WHILE,FOLLOW_WHILE_in_statement635); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_statement639);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_statement_in_statement643);
                    statement(symtable, structTable);

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_statement648);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 7 :
                    // EvilAST.g:117:6: delete
                    {
                    pushFollow(FOLLOW_delete_in_statement656);
                    delete();

                    state._fsp--;


                    }
                    break;
                case 8 :
                    // EvilAST.g:118:6: ret
                    {
                    pushFollow(FOLLOW_ret_in_statement663);
                    ret();

                    state._fsp--;


                    }
                    break;
                case 9 :
                    // EvilAST.g:119:6: invocation
                    {
                    pushFollow(FOLLOW_invocation_in_statement670);
                    invocation();

                    state._fsp--;


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "statement"


    // $ANTLR start "assignment"
    // EvilAST.g:122:1: assignment[SymTable symtable, StructTable stable] : ^( ASSIGN expr= expression lval= lvalue[symtable, stable] ) ;
    public final void assignment(SymTable symtable, StructTable stable) throws RecognitionException {
        try {
            // EvilAST.g:123:4: ( ^( ASSIGN expr= expression lval= lvalue[symtable, stable] ) )
            // EvilAST.g:123:6: ^( ASSIGN expr= expression lval= lvalue[symtable, stable] )
            {
            match(input,ASSIGN,FOLLOW_ASSIGN_in_assignment687); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_expression_in_assignment691);
            expression();

            state._fsp--;

            pushFollow(FOLLOW_lvalue_in_assignment695);
            lvalue(symtable, stable);

            state._fsp--;


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "assignment"


    // $ANTLR start "print"
    // EvilAST.g:126:1: print : ^( PRINT expression ( ENDL )? ) ;
    public final void print() throws RecognitionException {
        try {
            // EvilAST.g:127:4: ( ^( PRINT expression ( ENDL )? ) )
            // EvilAST.g:127:6: ^( PRINT expression ( ENDL )? )
            {
            match(input,PRINT,FOLLOW_PRINT_in_print713); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_expression_in_print715);
            expression();

            state._fsp--;

            // EvilAST.g:127:25: ( ENDL )?
            int alt13=2;
            int LA13_0 = input.LA(1);

            if ( (LA13_0==ENDL) ) {
                alt13=1;
            }
            switch (alt13) {
                case 1 :
                    // EvilAST.g:127:26: ENDL
                    {
                    match(input,ENDL,FOLLOW_ENDL_in_print718); 

                    }
                    break;

            }


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "print"


    // $ANTLR start "read"
    // EvilAST.g:130:1: read[SymTable symtable, StructTable stable] : ^( READ lvalue[symtable, stable] ) ;
    public final void read(SymTable symtable, StructTable stable) throws RecognitionException {
        try {
            // EvilAST.g:131:4: ( ^( READ lvalue[symtable, stable] ) )
            // EvilAST.g:131:6: ^( READ lvalue[symtable, stable] )
            {
            match(input,READ,FOLLOW_READ_in_read739); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_lvalue_in_read741);
            lvalue(symtable, stable);

            state._fsp--;


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "read"


    // $ANTLR start "delete"
    // EvilAST.g:134:1: delete : ^( DELETE expression ) ;
    public final void delete() throws RecognitionException {
        try {
            // EvilAST.g:135:4: ( ^( DELETE expression ) )
            // EvilAST.g:135:6: ^( DELETE expression )
            {
            match(input,DELETE,FOLLOW_DELETE_in_delete759); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_expression_in_delete761);
            expression();

            state._fsp--;


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "delete"


    // $ANTLR start "ret"
    // EvilAST.g:138:1: ret : ^( RETURN ( expression )? ) ;
    public final void ret() throws RecognitionException {
        try {
            // EvilAST.g:139:4: ( ^( RETURN ( expression )? ) )
            // EvilAST.g:139:6: ^( RETURN ( expression )? )
            {
            match(input,RETURN,FOLLOW_RETURN_in_ret778); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // EvilAST.g:139:15: ( expression )?
                int alt14=2;
                int LA14_0 = input.LA(1);

                if ( ((LA14_0>=TRUE && LA14_0<=NULL)||LA14_0==INVOKE||LA14_0==NEG||(LA14_0>=DOT && LA14_0<=INTEGER)) ) {
                    alt14=1;
                }
                switch (alt14) {
                    case 1 :
                        // EvilAST.g:139:16: expression
                        {
                        pushFollow(FOLLOW_expression_in_ret781);
                        expression();

                        state._fsp--;


                        }
                        break;

                }


                match(input, Token.UP, null); 
            }

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "ret"


    // $ANTLR start "invocation"
    // EvilAST.g:142:1: invocation : ^( INVOKE id= ID args= arguments ) ;
    public final void invocation() throws RecognitionException {
        CommonTree id=null;

        try {
            // EvilAST.g:143:4: ( ^( INVOKE id= ID args= arguments ) )
            // EvilAST.g:143:6: ^( INVOKE id= ID args= arguments )
            {
            match(input,INVOKE,FOLLOW_INVOKE_in_invocation800); 

            match(input, Token.DOWN, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_invocation804); 
            pushFollow(FOLLOW_arguments_in_invocation808);
            arguments();

            state._fsp--;


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "invocation"


    // $ANTLR start "lvalue"
    // EvilAST.g:146:1: lvalue[SymTable symtable, StructTable stable] : ^( DOT structId= ID subvalue[stable, $structId.text] ) ;
    public final void lvalue(SymTable symtable, StructTable stable) throws RecognitionException {
        CommonTree structId=null;

        try {
            // EvilAST.g:147:2: ( ^( DOT structId= ID subvalue[stable, $structId.text] ) )
            // EvilAST.g:147:4: ^( DOT structId= ID subvalue[stable, $structId.text] )
            {
            match(input,DOT,FOLLOW_DOT_in_lvalue824); 

            match(input, Token.DOWN, null); 
            structId=(CommonTree)match(input,ID,FOLLOW_ID_in_lvalue828); 

            			if(!symtable.isDefined((structId!=null?structId.getText():null)))
            			{
            				System.err.println("line " + (structId!=null?structId.getLine():0) + ": undeclared symbol '" + (structId!=null?structId.getText():null) + "'");
            			}
            			if(!stable.isDefined(symtable.getType((structId!=null?structId.getText():null))))
            			{
            				System.err.println("line " + (structId!=null?structId.getLine():0) + ": undefined struct type '" + (structId!=null?structId.getText():null) + "'");
            			}
            			// Ok, this ID looks pretty valid.
            		
            pushFollow(FOLLOW_subvalue_in_lvalue836);
            subvalue(stable, (structId!=null?structId.getText():null));

            state._fsp--;


            match(input, Token.UP, null); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "lvalue"


    // $ANTLR start "subvalue"
    // EvilAST.g:162:1: subvalue[StructTable stable, String parent] : ( ^( DOT structId= ID subvalue[stable, $structId.text] ) | valId= ID );
    public final void subvalue(StructTable stable, String parent) throws RecognitionException {
        CommonTree structId=null;
        CommonTree valId=null;

        try {
            // EvilAST.g:163:4: ( ^( DOT structId= ID subvalue[stable, $structId.text] ) | valId= ID )
            int alt15=2;
            int LA15_0 = input.LA(1);

            if ( (LA15_0==DOT) ) {
                alt15=1;
            }
            else if ( (LA15_0==ID) ) {
                alt15=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 15, 0, input);

                throw nvae;
            }
            switch (alt15) {
                case 1 :
                    // EvilAST.g:163:6: ^( DOT structId= ID subvalue[stable, $structId.text] )
                    {
                    match(input,DOT,FOLLOW_DOT_in_subvalue853); 

                    match(input, Token.DOWN, null); 
                    structId=(CommonTree)match(input,ID,FOLLOW_ID_in_subvalue857); 

                            if(!stable.isField(parent, (structId!=null?structId.getText():null)))
                            {
                    	        System.err.println("line " + (structId!=null?structId.getLine():0) + ": invalid field '" + (structId!=null?structId.getText():null) + "' in struct '" + parent + "'");
                            }
                         
                    pushFollow(FOLLOW_subvalue_in_subvalue872);
                    subvalue(stable, (structId!=null?structId.getText():null));

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 2 :
                    // EvilAST.g:171:6: valId= ID
                    {
                    valId=(CommonTree)match(input,ID,FOLLOW_ID_in_subvalue883); 

                            if(!stable.isField(parent, (valId!=null?valId.getText():null)))
                            {
                    	        System.err.println("line " + (valId!=null?valId.getLine():0) + ": invalid field '" + (valId!=null?valId.getText():null) + "' in struct '" + parent + "'");
                            }
                         

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "subvalue"


    // $ANTLR start "expression"
    // EvilAST.g:180:1: expression : ( ^( AND lexpr= expression rexpr= expression ) | ^( OR lexpr= expression rexpr= expression ) | ^( ( EQ | LT | GT | NE | LE | GE ) rexpr= expression lexpr= expression ) | ^( ( PLUS | MINUS ) rexpr= expression lexpr= expression ) | ^( ( TIMES | DIVIDE ) rexpr= expression lexpr= expression ) | ^( NEG expression ) | ^( NOT expression ) | ^( DOT expression ID ) | ^( INVOKE id= ID args= arguments ) | ID | INTEGER | TRUE | FALSE | ^( NEW ID ) | NULL );
    public final void expression() throws RecognitionException {
        CommonTree id=null;

        try {
            // EvilAST.g:181:4: ( ^( AND lexpr= expression rexpr= expression ) | ^( OR lexpr= expression rexpr= expression ) | ^( ( EQ | LT | GT | NE | LE | GE ) rexpr= expression lexpr= expression ) | ^( ( PLUS | MINUS ) rexpr= expression lexpr= expression ) | ^( ( TIMES | DIVIDE ) rexpr= expression lexpr= expression ) | ^( NEG expression ) | ^( NOT expression ) | ^( DOT expression ID ) | ^( INVOKE id= ID args= arguments ) | ID | INTEGER | TRUE | FALSE | ^( NEW ID ) | NULL )
            int alt16=15;
            switch ( input.LA(1) ) {
            case AND:
                {
                alt16=1;
                }
                break;
            case OR:
                {
                alt16=2;
                }
                break;
            case EQ:
            case LT:
            case GT:
            case NE:
            case LE:
            case GE:
                {
                alt16=3;
                }
                break;
            case PLUS:
            case MINUS:
                {
                alt16=4;
                }
                break;
            case TIMES:
            case DIVIDE:
                {
                alt16=5;
                }
                break;
            case NEG:
                {
                alt16=6;
                }
                break;
            case NOT:
                {
                alt16=7;
                }
                break;
            case DOT:
                {
                alt16=8;
                }
                break;
            case INVOKE:
                {
                alt16=9;
                }
                break;
            case ID:
                {
                alt16=10;
                }
                break;
            case INTEGER:
                {
                alt16=11;
                }
                break;
            case TRUE:
                {
                alt16=12;
                }
                break;
            case FALSE:
                {
                alt16=13;
                }
                break;
            case NEW:
                {
                alt16=14;
                }
                break;
            case NULL:
                {
                alt16=15;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 16, 0, input);

                throw nvae;
            }

            switch (alt16) {
                case 1 :
                    // EvilAST.g:181:6: ^( AND lexpr= expression rexpr= expression )
                    {
                    match(input,AND,FOLLOW_AND_in_expression906); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression910);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression914);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 2 :
                    // EvilAST.g:182:6: ^( OR lexpr= expression rexpr= expression )
                    {
                    match(input,OR,FOLLOW_OR_in_expression923); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression927);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression931);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 3 :
                    // EvilAST.g:184:6: ^( ( EQ | LT | GT | NE | LE | GE ) rexpr= expression lexpr= expression )
                    {
                    if ( (input.LA(1)>=EQ && input.LA(1)<=GE) ) {
                        input.consume();
                        state.errorRecovery=false;
                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        throw mse;
                    }


                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression967);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression971);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 4 :
                    // EvilAST.g:185:6: ^( ( PLUS | MINUS ) rexpr= expression lexpr= expression )
                    {
                    if ( (input.LA(1)>=PLUS && input.LA(1)<=MINUS) ) {
                        input.consume();
                        state.errorRecovery=false;
                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        throw mse;
                    }


                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression990);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression994);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 5 :
                    // EvilAST.g:186:6: ^( ( TIMES | DIVIDE ) rexpr= expression lexpr= expression )
                    {
                    if ( (input.LA(1)>=TIMES && input.LA(1)<=DIVIDE) ) {
                        input.consume();
                        state.errorRecovery=false;
                    }
                    else {
                        MismatchedSetException mse = new MismatchedSetException(null,input);
                        throw mse;
                    }


                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression1013);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression1017);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 6 :
                    // EvilAST.g:188:6: ^( NEG expression )
                    {
                    match(input,NEG,FOLLOW_NEG_in_expression1027); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression1029);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 7 :
                    // EvilAST.g:189:6: ^( NOT expression )
                    {
                    match(input,NOT,FOLLOW_NOT_in_expression1038); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression1040);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 8 :
                    // EvilAST.g:190:6: ^( DOT expression ID )
                    {
                    match(input,DOT,FOLLOW_DOT_in_expression1049); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression1051);
                    expression();

                    state._fsp--;

                    match(input,ID,FOLLOW_ID_in_expression1053); 

                    match(input, Token.UP, null); 

                    }
                    break;
                case 9 :
                    // EvilAST.g:192:6: ^( INVOKE id= ID args= arguments )
                    {
                    match(input,INVOKE,FOLLOW_INVOKE_in_expression1063); 

                    match(input, Token.DOWN, null); 
                    id=(CommonTree)match(input,ID,FOLLOW_ID_in_expression1067); 
                    pushFollow(FOLLOW_arguments_in_expression1071);
                    arguments();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 10 :
                    // EvilAST.g:193:6: ID
                    {
                    match(input,ID,FOLLOW_ID_in_expression1079); 

                    }
                    break;
                case 11 :
                    // EvilAST.g:194:6: INTEGER
                    {
                    match(input,INTEGER,FOLLOW_INTEGER_in_expression1086); 

                    }
                    break;
                case 12 :
                    // EvilAST.g:195:6: TRUE
                    {
                    match(input,TRUE,FOLLOW_TRUE_in_expression1093); 

                    }
                    break;
                case 13 :
                    // EvilAST.g:196:6: FALSE
                    {
                    match(input,FALSE,FOLLOW_FALSE_in_expression1100); 

                    }
                    break;
                case 14 :
                    // EvilAST.g:197:6: ^( NEW ID )
                    {
                    match(input,NEW,FOLLOW_NEW_in_expression1108); 

                    match(input, Token.DOWN, null); 
                    match(input,ID,FOLLOW_ID_in_expression1110); 

                    match(input, Token.UP, null); 

                    }
                    break;
                case 15 :
                    // EvilAST.g:198:6: NULL
                    {
                    match(input,NULL,FOLLOW_NULL_in_expression1118); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "expression"


    // $ANTLR start "arguments"
    // EvilAST.g:200:1: arguments : arg_list ;
    public final void arguments() throws RecognitionException {
        try {
            // EvilAST.g:201:4: ( arg_list )
            // EvilAST.g:201:6: arg_list
            {
            pushFollow(FOLLOW_arg_list_in_arguments1132);
            arg_list();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "arguments"


    // $ANTLR start "arg_list"
    // EvilAST.g:204:1: arg_list : ( ^( ARGS ( expression )+ ) | ARGS );
    public final void arg_list() throws RecognitionException {
        try {
            // EvilAST.g:205:4: ( ^( ARGS ( expression )+ ) | ARGS )
            int alt18=2;
            int LA18_0 = input.LA(1);

            if ( (LA18_0==ARGS) ) {
                int LA18_1 = input.LA(2);

                if ( (LA18_1==DOWN) ) {
                    alt18=1;
                }
                else if ( (LA18_1==UP) ) {
                    alt18=2;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 18, 1, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 18, 0, input);

                throw nvae;
            }
            switch (alt18) {
                case 1 :
                    // EvilAST.g:205:6: ^( ARGS ( expression )+ )
                    {
                    match(input,ARGS,FOLLOW_ARGS_in_arg_list1148); 

                    match(input, Token.DOWN, null); 
                    // EvilAST.g:205:13: ( expression )+
                    int cnt17=0;
                    loop17:
                    do {
                        int alt17=2;
                        int LA17_0 = input.LA(1);

                        if ( ((LA17_0>=TRUE && LA17_0<=NULL)||LA17_0==INVOKE||LA17_0==NEG||(LA17_0>=DOT && LA17_0<=INTEGER)) ) {
                            alt17=1;
                        }


                        switch (alt17) {
                    	case 1 :
                    	    // EvilAST.g:205:13: expression
                    	    {
                    	    pushFollow(FOLLOW_expression_in_arg_list1150);
                    	    expression();

                    	    state._fsp--;


                    	    }
                    	    break;

                    	default :
                    	    if ( cnt17 >= 1 ) break loop17;
                                EarlyExitException eee =
                                    new EarlyExitException(17, input);
                                throw eee;
                        }
                        cnt17++;
                    } while (true);


                    match(input, Token.UP, null); 

                    }
                    break;
                case 2 :
                    // EvilAST.g:206:6: ARGS
                    {
                    match(input,ARGS,FOLLOW_ARGS_in_arg_list1159); 

                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "arg_list"

    // Delegated rules


 

    public static final BitSet FOLLOW_PROGRAM_in_program50 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_types_in_program52 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_declarations_in_program55 = new BitSet(new long[]{0x0000000002000000L});
    public static final BitSet FOLLOW_functions_in_program64 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_TYPES_in_types85 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_sub_in_types87 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_TYPES_in_types97 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_type_declaration_in_type_sub113 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_type_sub_in_type_sub116 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRUCT_in_type_declaration143 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_type_declaration147 = new BitSet(new long[]{0x0000000004000000L});
    public static final BitSet FOLLOW_nested_decl_in_type_declaration166 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_decl_in_nested_decl199 = new BitSet(new long[]{0x0000000004000002L});
    public static final BitSet FOLLOW_DECL_in_decl218 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_decl221 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_in_decl225 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_decl231 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_INT_in_type261 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BOOL_in_type270 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRUCT_in_type280 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_type284 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DECLS_in_declarations309 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_declaration_in_declarations311 = new BitSet(new long[]{0x0000000008000008L});
    public static final BitSet FOLLOW_DECLLIST_in_declaration334 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_declaration337 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_in_declaration341 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_id_list_in_declaration345 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_list_id_in_id_list366 = new BitSet(new long[]{0x0100000000000002L});
    public static final BitSet FOLLOW_ID_in_list_id390 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FUNCS_in_functions418 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_function_in_functions420 = new BitSet(new long[]{0x0000000000000088L});
    public static final BitSet FOLLOW_FUN_in_function441 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_function445 = new BitSet(new long[]{0x0000000010000000L});
    public static final BitSet FOLLOW_parameters_in_function461 = new BitSet(new long[]{0x0000000020000000L});
    public static final BitSet FOLLOW_RETTYPE_in_function472 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_return_type_in_function476 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_declarations_in_function486 = new BitSet(new long[]{0x000002014001DA00L});
    public static final BitSet FOLLOW_statement_in_function504 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PARAMS_in_parameters524 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_decl_in_parameters526 = new BitSet(new long[]{0x0000000004000008L});
    public static final BitSet FOLLOW_type_in_return_type550 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_VOID_in_return_type558 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BLOCK_in_statement575 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_STMTS_in_statement578 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_statement_in_statement580 = new BitSet(new long[]{0x000002014001DA08L});
    public static final BitSet FOLLOW_assignment_in_statement591 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_print_in_statement599 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_read_in_statement606 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IF_in_statement615 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_statement617 = new BitSet(new long[]{0x000002014001DA00L});
    public static final BitSet FOLLOW_statement_in_statement619 = new BitSet(new long[]{0x000002014001DA08L});
    public static final BitSet FOLLOW_statement_in_statement623 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_WHILE_in_statement635 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_statement639 = new BitSet(new long[]{0x000002014001DA00L});
    public static final BitSet FOLLOW_statement_in_statement643 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_statement648 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_delete_in_statement656 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ret_in_statement663 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_invocation_in_statement670 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ASSIGN_in_assignment687 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_assignment691 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_lvalue_in_assignment695 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PRINT_in_print713 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_print715 = new BitSet(new long[]{0x0000000000000408L});
    public static final BitSet FOLLOW_ENDL_in_print718 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_READ_in_read739 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_lvalue_in_read741 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DELETE_in_delete759 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_delete761 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RETURN_in_ret778 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_ret781 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_INVOKE_in_invocation800 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_invocation804 = new BitSet(new long[]{0x0000000200000000L});
    public static final BitSet FOLLOW_arguments_in_invocation808 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DOT_in_lvalue824 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_lvalue828 = new BitSet(new long[]{0x0100040000000000L});
    public static final BitSet FOLLOW_subvalue_in_lvalue836 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DOT_in_subvalue853 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_subvalue857 = new BitSet(new long[]{0x0100040000000000L});
    public static final BitSet FOLLOW_subvalue_in_subvalue872 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_subvalue883 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_AND_in_expression906 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression910 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression914 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_OR_in_expression923 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression927 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression931 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_set_in_expression941 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression967 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression971 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_set_in_expression980 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression990 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression994 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_set_in_expression1003 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression1013 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression1017 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_NEG_in_expression1027 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression1029 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_NOT_in_expression1038 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression1040 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DOT_in_expression1049 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression1051 = new BitSet(new long[]{0x0100000000000000L});
    public static final BitSet FOLLOW_ID_in_expression1053 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_INVOKE_in_expression1063 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_expression1067 = new BitSet(new long[]{0x0000000200000000L});
    public static final BitSet FOLLOW_arguments_in_expression1071 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_expression1079 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INTEGER_in_expression1086 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_TRUE_in_expression1093 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FALSE_in_expression1100 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NEW_in_expression1108 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_expression1110 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_NULL_in_expression1118 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_arg_list_in_arguments1132 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ARGS_in_arg_list1148 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_arg_list1150 = new BitSet(new long[]{0x03FFFC05001E0008L});
    public static final BitSet FOLLOW_ARGS_in_arg_list1159 = new BitSet(new long[]{0x0000000000000002L});

}