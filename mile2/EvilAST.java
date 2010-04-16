// $ANTLR 3.1.3 Mar 18, 2009 10:09:25 EvilAST.g 2010-04-16 02:03:45

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


      private boolean DEBUG = true;



    // $ANTLR start "program"
    // EvilAST.g:13:1: program[StructTable structTable, SymTable symtable, FunTable funtable] : ^( PROGRAM types[symtable, structTable] declarations[symtable, structTable] functions[structTable, symtable, funtable] ) ;
    public final void program(StructTable structTable, SymTable symtable, FunTable funtable) throws RecognitionException {
        try {
            // EvilAST.g:14:4: ( ^( PROGRAM types[symtable, structTable] declarations[symtable, structTable] functions[structTable, symtable, funtable] ) )
            // EvilAST.g:14:6: ^( PROGRAM types[symtable, structTable] declarations[symtable, structTable] functions[structTable, symtable, funtable] )
            {
            match(input,PROGRAM,FOLLOW_PROGRAM_in_program56); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_types_in_program58);
            types(symtable, structTable);

            state._fsp--;

            pushFollow(FOLLOW_declarations_in_program65);
            declarations(symtable, structTable);

            state._fsp--;

            pushFollow(FOLLOW_functions_in_program74);
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
    // EvilAST.g:19:1: types[SymTable symtable, StructTable stable] : ( ^( TYPES type_sub[symtable, stable] ) | TYPES );
    public final void types(SymTable symtable, StructTable stable) throws RecognitionException {
        try {
            // EvilAST.g:20:3: ( ^( TYPES type_sub[symtable, stable] ) | TYPES )
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
                    // EvilAST.g:20:5: ^( TYPES type_sub[symtable, stable] )
                    {
                    match(input,TYPES,FOLLOW_TYPES_in_types95); 

                    if ( input.LA(1)==Token.DOWN ) {
                        match(input, Token.DOWN, null); 
                        pushFollow(FOLLOW_type_sub_in_types97);
                        type_sub(symtable, stable);

                        state._fsp--;


                        match(input, Token.UP, null); 
                    }

                    }
                    break;
                case 2 :
                    // EvilAST.g:21:7: TYPES
                    {
                    match(input,TYPES,FOLLOW_TYPES_in_types107); 

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
    // EvilAST.g:24:1: type_sub[SymTable symtable, StructTable stable] : ( type_declaration[symtable, stable] type_sub[symtable, stable] | );
    public final void type_sub(SymTable symtable, StructTable stable) throws RecognitionException {
        try {
            // EvilAST.g:25:4: ( type_declaration[symtable, stable] type_sub[symtable, stable] | )
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
                    // EvilAST.g:25:6: type_declaration[symtable, stable] type_sub[symtable, stable]
                    {
                    pushFollow(FOLLOW_type_declaration_in_type_sub123);
                    type_declaration(symtable, stable);

                    state._fsp--;

                    pushFollow(FOLLOW_type_sub_in_type_sub126);
                    type_sub(symtable, stable);

                    state._fsp--;


                    }
                    break;
                case 2 :
                    // EvilAST.g:27:4: 
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
    // EvilAST.g:29:1: type_declaration[SymTable symtable, StructTable stable] : ^( STRUCT id= ID structSymTable= nested_decl[stable] ) ;
    public final void type_declaration(SymTable symtable, StructTable stable) throws RecognitionException {
        CommonTree id=null;
        SymTable structSymTable = null;


        try {
            // EvilAST.g:30:4: ( ^( STRUCT id= ID structSymTable= nested_decl[stable] ) )
            // EvilAST.g:30:6: ^( STRUCT id= ID structSymTable= nested_decl[stable] )
            {
            match(input,STRUCT,FOLLOW_STRUCT_in_type_declaration153); 

            match(input, Token.DOWN, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_type_declaration157); 

            			if(DEBUG) System.out.println("g> adding struct '" + (id!=null?id.getText():null) + "'");
            			if(DEBUG) stable.print();
            			stable.addStruct((id!=null?id.getText():null)); 
            		
            pushFollow(FOLLOW_nested_decl_in_type_declaration170);
            structSymTable=nested_decl(stable);

            state._fsp--;


            match(input, Token.UP, null); 
             stable.updateStruct((id!=null?id.getText():null), structSymTable); 

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
    // EvilAST.g:40:1: nested_decl[StructTable stable] returns [SymTable subtable = new SymTable()] : ( decl[subtable, stable] )+ ;
    public final SymTable nested_decl(StructTable stable) throws RecognitionException {
        SymTable subtable =  new SymTable();

        try {
            // EvilAST.g:41:3: ( ( decl[subtable, stable] )+ )
            // EvilAST.g:41:5: ( decl[subtable, stable] )+
            {
            // EvilAST.g:41:5: ( decl[subtable, stable] )+
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
            	    // EvilAST.g:41:5: decl[subtable, stable]
            	    {
            	    pushFollow(FOLLOW_decl_in_nested_decl203);
            	    decl(subtable, stable);

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
    // EvilAST.g:44:1: decl[SymTable subtable, StructTable stable] : ^( DECL ^( TYPE t= type[stable] ) id= ID ) ;
    public final void decl(SymTable subtable, StructTable stable) throws RecognitionException {
        CommonTree id=null;
        String t = null;


        try {
            // EvilAST.g:45:4: ( ^( DECL ^( TYPE t= type[stable] ) id= ID ) )
            // EvilAST.g:45:6: ^( DECL ^( TYPE t= type[stable] ) id= ID )
            {
            match(input,DECL,FOLLOW_DECL_in_decl222); 

            match(input, Token.DOWN, null); 
            match(input,TYPE,FOLLOW_TYPE_in_decl225); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_type_in_decl229);
            t=type(stable);

            state._fsp--;


            match(input, Token.UP, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_decl235); 

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
    // EvilAST.g:49:1: type[StructTable stable] returns [String t = null] : ( INT | BOOL | ^( STRUCT id= ID ) );
    public final String type(StructTable stable) throws RecognitionException {
        String t =  null;

        CommonTree id=null;

        try {
            // EvilAST.g:50:3: ( INT | BOOL | ^( STRUCT id= ID ) )
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
                    // EvilAST.g:50:6: INT
                    {
                    match(input,INT,FOLLOW_INT_in_type264); 
                     t = SymTable.intType(); 

                    }
                    break;
                case 2 :
                    // EvilAST.g:51:6: BOOL
                    {
                    match(input,BOOL,FOLLOW_BOOL_in_type273); 
                     t = SymTable.boolType(); 

                    }
                    break;
                case 3 :
                    // EvilAST.g:52:6: ^( STRUCT id= ID )
                    {
                    match(input,STRUCT,FOLLOW_STRUCT_in_type283); 

                    match(input, Token.DOWN, null); 
                    id=(CommonTree)match(input,ID,FOLLOW_ID_in_type287); 

                    match(input, Token.UP, null); 

                            if (!stable.isDefined((id!=null?id.getText():null)))
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
    // EvilAST.g:62:1: declarations[SymTable symtable, StructTable stable] : ^( DECLS ( declaration[symtable, stable] )* ) ;
    public final void declarations(SymTable symtable, StructTable stable) throws RecognitionException {
        try {
            // EvilAST.g:63:4: ( ^( DECLS ( declaration[symtable, stable] )* ) )
            // EvilAST.g:63:6: ^( DECLS ( declaration[symtable, stable] )* )
            {
            match(input,DECLS,FOLLOW_DECLS_in_declarations312); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // EvilAST.g:63:14: ( declaration[symtable, stable] )*
                loop5:
                do {
                    int alt5=2;
                    int LA5_0 = input.LA(1);

                    if ( (LA5_0==DECLLIST) ) {
                        alt5=1;
                    }


                    switch (alt5) {
                	case 1 :
                	    // EvilAST.g:63:14: declaration[symtable, stable]
                	    {
                	    pushFollow(FOLLOW_declaration_in_declarations314);
                	    declaration(symtable, stable);

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
    // EvilAST.g:66:1: declaration[SymTable symtable, StructTable stable] : ^( DECLLIST ^( TYPE t= type[stable] ) id_list[symtable, t] ) ;
    public final void declaration(SymTable symtable, StructTable stable) throws RecognitionException {
        String t = null;


        try {
            // EvilAST.g:67:4: ( ^( DECLLIST ^( TYPE t= type[stable] ) id_list[symtable, t] ) )
            // EvilAST.g:67:8: ^( DECLLIST ^( TYPE t= type[stable] ) id_list[symtable, t] )
            {
            match(input,DECLLIST,FOLLOW_DECLLIST_in_declaration337); 

            match(input, Token.DOWN, null); 
            match(input,TYPE,FOLLOW_TYPE_in_declaration340); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_type_in_declaration344);
            t=type(stable);

            state._fsp--;


            match(input, Token.UP, null); 
            pushFollow(FOLLOW_id_list_in_declaration348);
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
    // EvilAST.g:70:1: id_list[SymTable symtable, String t] : ( list_id[symtable, t] )+ ;
    public final void id_list(SymTable symtable, String t) throws RecognitionException {
        try {
            // EvilAST.g:71:4: ( ( list_id[symtable, t] )+ )
            // EvilAST.g:71:8: ( list_id[symtable, t] )+
            {
            // EvilAST.g:71:8: ( list_id[symtable, t] )+
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
            	    // EvilAST.g:71:8: list_id[symtable, t]
            	    {
            	    pushFollow(FOLLOW_list_id_in_id_list369);
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
    // EvilAST.g:74:1: list_id[SymTable symtable, String t] : id= ID ;
    public final void list_id(SymTable symtable, String t) throws RecognitionException {
        CommonTree id=null;

        try {
            // EvilAST.g:75:4: (id= ID )
            // EvilAST.g:75:6: id= ID
            {
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_list_id393); 
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
    // EvilAST.g:89:1: functions[StructTable structTable, SymTable symtable, FunTable funtable] : ^( FUNCS ( function[structTable, symtable, funtable] )* ) ;
    public final void functions(StructTable structTable, SymTable symtable, FunTable funtable) throws RecognitionException {
        try {
            // EvilAST.g:90:4: ( ^( FUNCS ( function[structTable, symtable, funtable] )* ) )
            // EvilAST.g:90:6: ^( FUNCS ( function[structTable, symtable, funtable] )* )
            {
            match(input,FUNCS,FOLLOW_FUNCS_in_functions421); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // EvilAST.g:90:14: ( function[structTable, symtable, funtable] )*
                loop7:
                do {
                    int alt7=2;
                    int LA7_0 = input.LA(1);

                    if ( (LA7_0==FUN) ) {
                        alt7=1;
                    }


                    switch (alt7) {
                	case 1 :
                	    // EvilAST.g:90:14: function[structTable, symtable, funtable]
                	    {
                	    pushFollow(FOLLOW_function_in_functions423);
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
    // EvilAST.g:93:1: function[StructTable structTable, SymTable symtable, FunTable funtable] : ^( FUN id= ID parameters[locals, structTable] ^( RETTYPE retType= return_type[structTable] ) declarations[locals, structTable] statement[symtable, structTable] ) ;
    public final void function(StructTable structTable, SymTable symtable, FunTable funtable) throws RecognitionException {
        CommonTree id=null;
        String retType = null;


        try {
            // EvilAST.g:94:4: ( ^( FUN id= ID parameters[locals, structTable] ^( RETTYPE retType= return_type[structTable] ) declarations[locals, structTable] statement[symtable, structTable] ) )
            // EvilAST.g:94:6: ^( FUN id= ID parameters[locals, structTable] ^( RETTYPE retType= return_type[structTable] ) declarations[locals, structTable] statement[symtable, structTable] )
            {
            match(input,FUN,FOLLOW_FUN_in_function444); 

            match(input, Token.DOWN, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_function448); 

                    if (symtable.isDefined((id!=null?id.getText():null)) || funtable.isDefined((id!=null?id.getText():null)))
                    {
                       System.err.println("line " + (id!=null?id.getLine():0) + ": symbol '" + id + "' already defined");
                    }
                    SymTable locals = new SymTable();
                 	
            pushFollow(FOLLOW_parameters_in_function464);
            parameters(locals, structTable);

            state._fsp--;

            match(input,RETTYPE,FOLLOW_RETTYPE_in_function475); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_return_type_in_function479);
            retType=return_type(structTable);

            state._fsp--;


            match(input, Token.UP, null); 
            pushFollow(FOLLOW_declarations_in_function489);
            declarations(locals, structTable);

            state._fsp--;

             symtable.insertSymbol((id!=null?id.getText():null), retType); 
            pushFollow(FOLLOW_statement_in_function507);
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
    // EvilAST.g:109:1: parameters[SymTable subtable, StructTable stable] : ^( PARAMS ( decl[subtable, stable] )* ) ;
    public final void parameters(SymTable subtable, StructTable stable) throws RecognitionException {
        try {
            // EvilAST.g:110:4: ( ^( PARAMS ( decl[subtable, stable] )* ) )
            // EvilAST.g:110:6: ^( PARAMS ( decl[subtable, stable] )* )
            {
            match(input,PARAMS,FOLLOW_PARAMS_in_parameters527); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // EvilAST.g:110:15: ( decl[subtable, stable] )*
                loop8:
                do {
                    int alt8=2;
                    int LA8_0 = input.LA(1);

                    if ( (LA8_0==DECL) ) {
                        alt8=1;
                    }


                    switch (alt8) {
                	case 1 :
                	    // EvilAST.g:110:15: decl[subtable, stable]
                	    {
                	    pushFollow(FOLLOW_decl_in_parameters529);
                	    decl(subtable, stable);

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
    // EvilAST.g:113:1: return_type[StructTable stable] returns [String t = null] : ( type[stable] | VOID );
    public final String return_type(StructTable stable) throws RecognitionException {
        String t =  null;

        try {
            // EvilAST.g:114:4: ( type[stable] | VOID )
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
                    // EvilAST.g:114:6: type[stable]
                    {
                    pushFollow(FOLLOW_type_in_return_type553);
                    type(stable);

                    state._fsp--;


                    }
                    break;
                case 2 :
                    // EvilAST.g:115:6: VOID
                    {
                    match(input,VOID,FOLLOW_VOID_in_return_type561); 

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
    // EvilAST.g:118:1: statement[SymTable symtable, StructTable structTable] : ( ^( BLOCK ^( STMTS ( statement[symtable, structTable] )* ) ) | assignment[symtable, structTable] | print | read[symtable, structTable] | ^( IF expression statement[symtable, structTable] ( statement[symtable, structTable] )? ) | ^( WHILE expr= expression b= statement[symtable, structTable] expr2= expression ) | delete | ret | invocation );
    public final void statement(SymTable symtable, StructTable structTable) throws RecognitionException {
        try {
            // EvilAST.g:119:4: ( ^( BLOCK ^( STMTS ( statement[symtable, structTable] )* ) ) | assignment[symtable, structTable] | print | read[symtable, structTable] | ^( IF expression statement[symtable, structTable] ( statement[symtable, structTable] )? ) | ^( WHILE expr= expression b= statement[symtable, structTable] expr2= expression ) | delete | ret | invocation )
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
                    // EvilAST.g:119:6: ^( BLOCK ^( STMTS ( statement[symtable, structTable] )* ) )
                    {
                    match(input,BLOCK,FOLLOW_BLOCK_in_statement578); 

                    match(input, Token.DOWN, null); 
                    match(input,STMTS,FOLLOW_STMTS_in_statement581); 

                    if ( input.LA(1)==Token.DOWN ) {
                        match(input, Token.DOWN, null); 
                        // EvilAST.g:119:22: ( statement[symtable, structTable] )*
                        loop10:
                        do {
                            int alt10=2;
                            int LA10_0 = input.LA(1);

                            if ( (LA10_0==PRINT||(LA10_0>=READ && LA10_0<=IF)||(LA10_0>=WHILE && LA10_0<=RETURN)||LA10_0==BLOCK||LA10_0==INVOKE||LA10_0==ASSIGN) ) {
                                alt10=1;
                            }


                            switch (alt10) {
                        	case 1 :
                        	    // EvilAST.g:119:22: statement[symtable, structTable]
                        	    {
                        	    pushFollow(FOLLOW_statement_in_statement583);
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
                    // EvilAST.g:120:6: assignment[symtable, structTable]
                    {
                    pushFollow(FOLLOW_assignment_in_statement594);
                    assignment(symtable, structTable);

                    state._fsp--;


                    }
                    break;
                case 3 :
                    // EvilAST.g:121:6: print
                    {
                    pushFollow(FOLLOW_print_in_statement602);
                    print();

                    state._fsp--;


                    }
                    break;
                case 4 :
                    // EvilAST.g:122:6: read[symtable, structTable]
                    {
                    pushFollow(FOLLOW_read_in_statement609);
                    read(symtable, structTable);

                    state._fsp--;


                    }
                    break;
                case 5 :
                    // EvilAST.g:123:6: ^( IF expression statement[symtable, structTable] ( statement[symtable, structTable] )? )
                    {
                    match(input,IF,FOLLOW_IF_in_statement618); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_statement620);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_statement_in_statement622);
                    statement(symtable, structTable);

                    state._fsp--;

                    // EvilAST.g:123:55: ( statement[symtable, structTable] )?
                    int alt11=2;
                    int LA11_0 = input.LA(1);

                    if ( (LA11_0==PRINT||(LA11_0>=READ && LA11_0<=IF)||(LA11_0>=WHILE && LA11_0<=RETURN)||LA11_0==BLOCK||LA11_0==INVOKE||LA11_0==ASSIGN) ) {
                        alt11=1;
                    }
                    switch (alt11) {
                        case 1 :
                            // EvilAST.g:123:56: statement[symtable, structTable]
                            {
                            pushFollow(FOLLOW_statement_in_statement626);
                            statement(symtable, structTable);

                            state._fsp--;


                            }
                            break;

                    }


                    match(input, Token.UP, null); 

                    }
                    break;
                case 6 :
                    // EvilAST.g:124:6: ^( WHILE expr= expression b= statement[symtable, structTable] expr2= expression )
                    {
                    match(input,WHILE,FOLLOW_WHILE_in_statement638); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_statement642);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_statement_in_statement646);
                    statement(symtable, structTable);

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_statement651);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 7 :
                    // EvilAST.g:125:6: delete
                    {
                    pushFollow(FOLLOW_delete_in_statement659);
                    delete();

                    state._fsp--;


                    }
                    break;
                case 8 :
                    // EvilAST.g:126:6: ret
                    {
                    pushFollow(FOLLOW_ret_in_statement666);
                    ret();

                    state._fsp--;


                    }
                    break;
                case 9 :
                    // EvilAST.g:127:6: invocation
                    {
                    pushFollow(FOLLOW_invocation_in_statement673);
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
    // EvilAST.g:130:1: assignment[SymTable symtable, StructTable stable] : ^( ASSIGN expr= expression lval= lvalue[symtable, stable] ) ;
    public final void assignment(SymTable symtable, StructTable stable) throws RecognitionException {
        try {
            // EvilAST.g:131:4: ( ^( ASSIGN expr= expression lval= lvalue[symtable, stable] ) )
            // EvilAST.g:131:6: ^( ASSIGN expr= expression lval= lvalue[symtable, stable] )
            {
            match(input,ASSIGN,FOLLOW_ASSIGN_in_assignment690); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_expression_in_assignment694);
            expression();

            state._fsp--;

            pushFollow(FOLLOW_lvalue_in_assignment698);
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
    // EvilAST.g:134:1: print : ^( PRINT expression ( ENDL )? ) ;
    public final void print() throws RecognitionException {
        try {
            // EvilAST.g:135:4: ( ^( PRINT expression ( ENDL )? ) )
            // EvilAST.g:135:6: ^( PRINT expression ( ENDL )? )
            {
            match(input,PRINT,FOLLOW_PRINT_in_print716); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_expression_in_print718);
            expression();

            state._fsp--;

            // EvilAST.g:135:25: ( ENDL )?
            int alt13=2;
            int LA13_0 = input.LA(1);

            if ( (LA13_0==ENDL) ) {
                alt13=1;
            }
            switch (alt13) {
                case 1 :
                    // EvilAST.g:135:26: ENDL
                    {
                    match(input,ENDL,FOLLOW_ENDL_in_print721); 

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
    // EvilAST.g:138:1: read[SymTable symtable, StructTable stable] : ^( READ lvalue[symtable, stable] ) ;
    public final void read(SymTable symtable, StructTable stable) throws RecognitionException {
        try {
            // EvilAST.g:139:4: ( ^( READ lvalue[symtable, stable] ) )
            // EvilAST.g:139:6: ^( READ lvalue[symtable, stable] )
            {
            match(input,READ,FOLLOW_READ_in_read742); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_lvalue_in_read744);
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
    // EvilAST.g:142:1: delete : ^( DELETE expression ) ;
    public final void delete() throws RecognitionException {
        try {
            // EvilAST.g:143:4: ( ^( DELETE expression ) )
            // EvilAST.g:143:6: ^( DELETE expression )
            {
            match(input,DELETE,FOLLOW_DELETE_in_delete762); 

            match(input, Token.DOWN, null); 
            pushFollow(FOLLOW_expression_in_delete764);
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
    // EvilAST.g:146:1: ret : ^( RETURN ( expression )? ) ;
    public final void ret() throws RecognitionException {
        try {
            // EvilAST.g:147:4: ( ^( RETURN ( expression )? ) )
            // EvilAST.g:147:6: ^( RETURN ( expression )? )
            {
            match(input,RETURN,FOLLOW_RETURN_in_ret781); 

            if ( input.LA(1)==Token.DOWN ) {
                match(input, Token.DOWN, null); 
                // EvilAST.g:147:15: ( expression )?
                int alt14=2;
                int LA14_0 = input.LA(1);

                if ( ((LA14_0>=TRUE && LA14_0<=NULL)||LA14_0==INVOKE||LA14_0==NEG||(LA14_0>=DOT && LA14_0<=INTEGER)) ) {
                    alt14=1;
                }
                switch (alt14) {
                    case 1 :
                        // EvilAST.g:147:16: expression
                        {
                        pushFollow(FOLLOW_expression_in_ret784);
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
    // EvilAST.g:150:1: invocation : ^( INVOKE id= ID args= arguments ) ;
    public final void invocation() throws RecognitionException {
        CommonTree id=null;

        try {
            // EvilAST.g:151:4: ( ^( INVOKE id= ID args= arguments ) )
            // EvilAST.g:151:6: ^( INVOKE id= ID args= arguments )
            {
            match(input,INVOKE,FOLLOW_INVOKE_in_invocation803); 

            match(input, Token.DOWN, null); 
            id=(CommonTree)match(input,ID,FOLLOW_ID_in_invocation807); 
            pushFollow(FOLLOW_arguments_in_invocation811);
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
    // EvilAST.g:154:1: lvalue[SymTable symtable, StructTable stable] : ^( DOT structId= ID subvalue[stable, $structId.text] ) ;
    public final void lvalue(SymTable symtable, StructTable stable) throws RecognitionException {
        CommonTree structId=null;

        try {
            // EvilAST.g:155:2: ( ^( DOT structId= ID subvalue[stable, $structId.text] ) )
            // EvilAST.g:155:4: ^( DOT structId= ID subvalue[stable, $structId.text] )
            {
            match(input,DOT,FOLLOW_DOT_in_lvalue827); 

            match(input, Token.DOWN, null); 
            structId=(CommonTree)match(input,ID,FOLLOW_ID_in_lvalue831); 

            			if(!symtable.isDefined((structId!=null?structId.getText():null)))
            			{
            				System.err.println("line " + (structId!=null?structId.getLine():0) + ": undeclared symbol '" + (structId!=null?structId.getText():null) + "'");
            			}
            			if(!stable.isDefined(symtable.getType((structId!=null?structId.getText():null))))
            			{
            				System.err.println("line " + (structId!=null?structId.getLine():0) + ": undefined struct type '" + (structId!=null?structId.getText():null) + "'");
            			}
            			// Ok, this ID looks pretty valid.
            		
            pushFollow(FOLLOW_subvalue_in_lvalue839);
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
    // EvilAST.g:170:1: subvalue[StructTable stable, String parent] : ( ^( DOT structId= ID subvalue[stable, $structId.text] ) | valId= ID );
    public final void subvalue(StructTable stable, String parent) throws RecognitionException {
        CommonTree structId=null;
        CommonTree valId=null;

        try {
            // EvilAST.g:171:4: ( ^( DOT structId= ID subvalue[stable, $structId.text] ) | valId= ID )
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
                    // EvilAST.g:171:6: ^( DOT structId= ID subvalue[stable, $structId.text] )
                    {
                    match(input,DOT,FOLLOW_DOT_in_subvalue856); 

                    match(input, Token.DOWN, null); 
                    structId=(CommonTree)match(input,ID,FOLLOW_ID_in_subvalue860); 

                            if(!stable.isField(parent, (structId!=null?structId.getText():null)))
                            {
                    	        System.err.println("line " + (structId!=null?structId.getLine():0) + ": invalid field '" + (structId!=null?structId.getText():null) + "' in struct '" + parent + "'");
                            }
                         
                    pushFollow(FOLLOW_subvalue_in_subvalue875);
                    subvalue(stable, (structId!=null?structId.getText():null));

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 2 :
                    // EvilAST.g:179:6: valId= ID
                    {
                    valId=(CommonTree)match(input,ID,FOLLOW_ID_in_subvalue886); 

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
    // EvilAST.g:188:1: expression : ( ^( AND lexpr= expression rexpr= expression ) | ^( OR lexpr= expression rexpr= expression ) | ^( ( EQ | LT | GT | NE | LE | GE ) rexpr= expression lexpr= expression ) | ^( ( PLUS | MINUS ) rexpr= expression lexpr= expression ) | ^( ( TIMES | DIVIDE ) rexpr= expression lexpr= expression ) | ^( NEG expression ) | ^( NOT expression ) | ^( DOT expression ID ) | ^( INVOKE id= ID args= arguments ) | ID | INTEGER | TRUE | FALSE | ^( NEW ID ) | NULL );
    public final void expression() throws RecognitionException {
        CommonTree id=null;

        try {
            // EvilAST.g:189:4: ( ^( AND lexpr= expression rexpr= expression ) | ^( OR lexpr= expression rexpr= expression ) | ^( ( EQ | LT | GT | NE | LE | GE ) rexpr= expression lexpr= expression ) | ^( ( PLUS | MINUS ) rexpr= expression lexpr= expression ) | ^( ( TIMES | DIVIDE ) rexpr= expression lexpr= expression ) | ^( NEG expression ) | ^( NOT expression ) | ^( DOT expression ID ) | ^( INVOKE id= ID args= arguments ) | ID | INTEGER | TRUE | FALSE | ^( NEW ID ) | NULL )
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
                    // EvilAST.g:189:6: ^( AND lexpr= expression rexpr= expression )
                    {
                    match(input,AND,FOLLOW_AND_in_expression909); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression913);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression917);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 2 :
                    // EvilAST.g:190:6: ^( OR lexpr= expression rexpr= expression )
                    {
                    match(input,OR,FOLLOW_OR_in_expression926); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression930);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression934);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 3 :
                    // EvilAST.g:192:6: ^( ( EQ | LT | GT | NE | LE | GE ) rexpr= expression lexpr= expression )
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
                    pushFollow(FOLLOW_expression_in_expression970);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression974);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 4 :
                    // EvilAST.g:193:6: ^( ( PLUS | MINUS ) rexpr= expression lexpr= expression )
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
                    pushFollow(FOLLOW_expression_in_expression993);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression997);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 5 :
                    // EvilAST.g:194:6: ^( ( TIMES | DIVIDE ) rexpr= expression lexpr= expression )
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
                    pushFollow(FOLLOW_expression_in_expression1016);
                    expression();

                    state._fsp--;

                    pushFollow(FOLLOW_expression_in_expression1020);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 6 :
                    // EvilAST.g:196:6: ^( NEG expression )
                    {
                    match(input,NEG,FOLLOW_NEG_in_expression1030); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression1032);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 7 :
                    // EvilAST.g:197:6: ^( NOT expression )
                    {
                    match(input,NOT,FOLLOW_NOT_in_expression1041); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression1043);
                    expression();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 8 :
                    // EvilAST.g:198:6: ^( DOT expression ID )
                    {
                    match(input,DOT,FOLLOW_DOT_in_expression1052); 

                    match(input, Token.DOWN, null); 
                    pushFollow(FOLLOW_expression_in_expression1054);
                    expression();

                    state._fsp--;

                    match(input,ID,FOLLOW_ID_in_expression1056); 

                    match(input, Token.UP, null); 

                    }
                    break;
                case 9 :
                    // EvilAST.g:200:6: ^( INVOKE id= ID args= arguments )
                    {
                    match(input,INVOKE,FOLLOW_INVOKE_in_expression1066); 

                    match(input, Token.DOWN, null); 
                    id=(CommonTree)match(input,ID,FOLLOW_ID_in_expression1070); 
                    pushFollow(FOLLOW_arguments_in_expression1074);
                    arguments();

                    state._fsp--;


                    match(input, Token.UP, null); 

                    }
                    break;
                case 10 :
                    // EvilAST.g:201:6: ID
                    {
                    match(input,ID,FOLLOW_ID_in_expression1082); 

                    }
                    break;
                case 11 :
                    // EvilAST.g:202:6: INTEGER
                    {
                    match(input,INTEGER,FOLLOW_INTEGER_in_expression1089); 

                    }
                    break;
                case 12 :
                    // EvilAST.g:203:6: TRUE
                    {
                    match(input,TRUE,FOLLOW_TRUE_in_expression1096); 

                    }
                    break;
                case 13 :
                    // EvilAST.g:204:6: FALSE
                    {
                    match(input,FALSE,FOLLOW_FALSE_in_expression1103); 

                    }
                    break;
                case 14 :
                    // EvilAST.g:205:6: ^( NEW ID )
                    {
                    match(input,NEW,FOLLOW_NEW_in_expression1111); 

                    match(input, Token.DOWN, null); 
                    match(input,ID,FOLLOW_ID_in_expression1113); 

                    match(input, Token.UP, null); 

                    }
                    break;
                case 15 :
                    // EvilAST.g:206:6: NULL
                    {
                    match(input,NULL,FOLLOW_NULL_in_expression1121); 

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
    // EvilAST.g:208:1: arguments : arg_list ;
    public final void arguments() throws RecognitionException {
        try {
            // EvilAST.g:209:4: ( arg_list )
            // EvilAST.g:209:6: arg_list
            {
            pushFollow(FOLLOW_arg_list_in_arguments1135);
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
    // EvilAST.g:212:1: arg_list : ( ^( ARGS ( expression )+ ) | ARGS );
    public final void arg_list() throws RecognitionException {
        try {
            // EvilAST.g:213:4: ( ^( ARGS ( expression )+ ) | ARGS )
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
                    // EvilAST.g:213:6: ^( ARGS ( expression )+ )
                    {
                    match(input,ARGS,FOLLOW_ARGS_in_arg_list1151); 

                    match(input, Token.DOWN, null); 
                    // EvilAST.g:213:13: ( expression )+
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
                    	    // EvilAST.g:213:13: expression
                    	    {
                    	    pushFollow(FOLLOW_expression_in_arg_list1153);
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
                    // EvilAST.g:214:6: ARGS
                    {
                    match(input,ARGS,FOLLOW_ARGS_in_arg_list1162); 

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


 

    public static final BitSet FOLLOW_PROGRAM_in_program56 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_types_in_program58 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_declarations_in_program65 = new BitSet(new long[]{0x0000000002000000L});
    public static final BitSet FOLLOW_functions_in_program74 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_TYPES_in_types95 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_sub_in_types97 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_TYPES_in_types107 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_type_declaration_in_type_sub123 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_type_sub_in_type_sub126 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRUCT_in_type_declaration153 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_type_declaration157 = new BitSet(new long[]{0x0000000004000000L});
    public static final BitSet FOLLOW_nested_decl_in_type_declaration170 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_decl_in_nested_decl203 = new BitSet(new long[]{0x0000000004000002L});
    public static final BitSet FOLLOW_DECL_in_decl222 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_decl225 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_in_decl229 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_decl235 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_INT_in_type264 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BOOL_in_type273 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRUCT_in_type283 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_type287 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DECLS_in_declarations312 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_declaration_in_declarations314 = new BitSet(new long[]{0x0000000008000008L});
    public static final BitSet FOLLOW_DECLLIST_in_declaration337 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_TYPE_in_declaration340 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_type_in_declaration344 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_id_list_in_declaration348 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_list_id_in_id_list369 = new BitSet(new long[]{0x0100000000000002L});
    public static final BitSet FOLLOW_ID_in_list_id393 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FUNCS_in_functions421 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_function_in_functions423 = new BitSet(new long[]{0x0000000000000088L});
    public static final BitSet FOLLOW_FUN_in_function444 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_function448 = new BitSet(new long[]{0x0000000010000000L});
    public static final BitSet FOLLOW_parameters_in_function464 = new BitSet(new long[]{0x0000000020000000L});
    public static final BitSet FOLLOW_RETTYPE_in_function475 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_return_type_in_function479 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_declarations_in_function489 = new BitSet(new long[]{0x000002014001DA00L});
    public static final BitSet FOLLOW_statement_in_function507 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PARAMS_in_parameters527 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_decl_in_parameters529 = new BitSet(new long[]{0x0000000004000008L});
    public static final BitSet FOLLOW_type_in_return_type553 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_VOID_in_return_type561 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_BLOCK_in_statement578 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_STMTS_in_statement581 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_statement_in_statement583 = new BitSet(new long[]{0x000002014001DA08L});
    public static final BitSet FOLLOW_assignment_in_statement594 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_print_in_statement602 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_read_in_statement609 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IF_in_statement618 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_statement620 = new BitSet(new long[]{0x000002014001DA00L});
    public static final BitSet FOLLOW_statement_in_statement622 = new BitSet(new long[]{0x000002014001DA08L});
    public static final BitSet FOLLOW_statement_in_statement626 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_WHILE_in_statement638 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_statement642 = new BitSet(new long[]{0x000002014001DA00L});
    public static final BitSet FOLLOW_statement_in_statement646 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_statement651 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_delete_in_statement659 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ret_in_statement666 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_invocation_in_statement673 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ASSIGN_in_assignment690 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_assignment694 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_lvalue_in_assignment698 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_PRINT_in_print716 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_print718 = new BitSet(new long[]{0x0000000000000408L});
    public static final BitSet FOLLOW_ENDL_in_print721 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_READ_in_read742 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_lvalue_in_read744 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DELETE_in_delete762 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_delete764 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_RETURN_in_ret781 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_ret784 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_INVOKE_in_invocation803 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_invocation807 = new BitSet(new long[]{0x0000000200000000L});
    public static final BitSet FOLLOW_arguments_in_invocation811 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DOT_in_lvalue827 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_lvalue831 = new BitSet(new long[]{0x0100040000000000L});
    public static final BitSet FOLLOW_subvalue_in_lvalue839 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DOT_in_subvalue856 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_subvalue860 = new BitSet(new long[]{0x0100040000000000L});
    public static final BitSet FOLLOW_subvalue_in_subvalue875 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_subvalue886 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_AND_in_expression909 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression913 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression917 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_OR_in_expression926 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression930 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression934 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_set_in_expression944 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression970 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression974 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_set_in_expression983 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression993 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression997 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_set_in_expression1006 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression1016 = new BitSet(new long[]{0x03FFFC05001E0000L});
    public static final BitSet FOLLOW_expression_in_expression1020 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_NEG_in_expression1030 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression1032 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_NOT_in_expression1041 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression1043 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_DOT_in_expression1052 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_expression1054 = new BitSet(new long[]{0x0100000000000000L});
    public static final BitSet FOLLOW_ID_in_expression1056 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_INVOKE_in_expression1066 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_expression1070 = new BitSet(new long[]{0x0000000200000000L});
    public static final BitSet FOLLOW_arguments_in_expression1074 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_ID_in_expression1082 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INTEGER_in_expression1089 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_TRUE_in_expression1096 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_FALSE_in_expression1103 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NEW_in_expression1111 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_ID_in_expression1113 = new BitSet(new long[]{0x0000000000000008L});
    public static final BitSet FOLLOW_NULL_in_expression1121 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_arg_list_in_arguments1135 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ARGS_in_arg_list1151 = new BitSet(new long[]{0x0000000000000004L});
    public static final BitSet FOLLOW_expression_in_arg_list1153 = new BitSet(new long[]{0x03FFFC05001E0008L});
    public static final BitSet FOLLOW_ARGS_in_arg_list1162 = new BitSet(new long[]{0x0000000000000002L});

}