module AgentContract  
  syntax Price   ::= Int  
  syntax Address ::= Int
  syntax Data    ::= Int
  syntax AExp ::= Price | Address | Data
                | "getData" "(" ")"       [strict]
  syntax BExp ::= Bool
                | "fundContract" "(" ")"  [strict]
                | "payout" "(" "AExp" ")" [strict]
                | "throw"

  configuration <AgentContract>
                  <caller> 0 </caller>
                  <balance> 0 </balance>
                  <k> $PGM:K </k>
                  <price> 0 </price>
                  <data> 0 </data>
                  <buyer> 0 </buyer>
                  <seller> 0 </seller>
                </AgentContract>

  syntax Int ::= "MAXVALUE"  [function]
  rule MAXVALUE => 2 ^Int 256 -Int 1

  rule <k> fundContract() => true ...</k>
    <caller> From </caller>
    <balance> Balance => Balance +Int Amount </balance>
    requires From ==Int Buyer
      andBool Amount >=Int Price

  rule <k> payout(Data) => true ...</k>
    <caller> From </caller>
    <data> _ => Data </data>
    <balance> Balance => Balance -Int Price </balance>
    requires From ==Int Seller
      andBool Balance >=Int Price

  rule <k> getData() => Data ...</k>
    <caller> From </caller>
    <data> Data <data>
    requires From ==Int Buyer