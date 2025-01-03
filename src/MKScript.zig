//NUMBER         → DIGIT+ ( "." DIGIT+ )? ;
//STRING         → "\"" <any char except "\"">* "\"" ;
//IDENTIFIER     → ALPHA ( ALPHA | DIGIT )* ;
//ALPHA          → "a" ... "z" | "A" ... "Z" | "_" ;
//DIGIT          → "0" ... "9" ;

const Digit = Range("0", "9");
const Alpha = Option(&.{ Range('a', 'z'), Range('A', 'Z'), Any("_") });
