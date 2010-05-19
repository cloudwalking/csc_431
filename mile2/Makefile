FILES=Evil.java


Evil.class : antlr.generated ${FILES}
	javac *.java

antlr.generated: antlr.generated.evil antlr.generated.evilAST antlr.generated.evilCFG
	touch antlr.generated

antlr.generated.evil : Evil.g
	java org.antlr.Tool Evil.g
	touch antlr.generated.evil

antlr.generated.evilAST : EvilAST.g
	java org.antlr.Tool EvilAST.g
	touch antlr.generated.evilAST

antlr.generated.evilCFG : EvilCFG.g
	java org.antlr.Tool EvilCFG.g
	touch antlr.generated.evilCFG

safe:
	\cp *.g *.java ~/.431

testiloc:
	perl testScript.pl iloc

testsparc:
	perl testScript.pl sparc

clean:
	rm *.class
	rm antlr.*
	rm EvilLexer.java
	rm EvilParser.java
	rm *.tokens
	rm EvilAST.java
	rm EvilCFG.java
