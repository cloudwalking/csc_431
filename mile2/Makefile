FILES=Evil.java


Evil.class : antlr.generated ${FILES}
	javac *.java

antlr.generated: antlr.generated.evil antlr.generated.evilAST
	touch antlr.generated

antlr.generated.evil : Evil.g
	java org.antlr.Tool Evil.g
	touch antlr.generated.evil

antlr.generated.evilAST : EvilAST.g
	java org.antlr.Tool EvilAST.g
	touch antlr.generated.evilAST

safe:
	\cp *.g *.java ~/.431

clean:
	rm *.class
	rm antlr.*
	rm EvilLexer.java
	rm EvilParser.java
	rm Evil.tokens
	rm EvilAST.java
