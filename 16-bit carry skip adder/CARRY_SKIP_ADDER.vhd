LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CARRY_SKIP_ADDER IS
    PORT (
        A : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000111110001111";
        B : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000101010111011";
        CIN : INOUT STD_LOGIC := '0';
        S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        COUT : OUT STD_LOGIC
    );
END ENTITY CARRY_SKIP_ADDER;

ARCHITECTURE rtl OF CARRY_SKIP_ADDER IS
    SIGNAL C, P : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL BP : STD_LOGIC;
    COMPONENT full_adder IS
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            Cin : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT mux2_1 IS
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            Sel : IN STD_LOGIC;
            Z : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    --S CALCULATION
    FA0 : full_adder PORT MAP(A => A(0), B => B(0), Cin => CIN, S => S(0), Cout => C(0));
    FA1 : full_adder PORT MAP(A => A(1), B => B(1), Cin => C(0), S => S(1), Cout => C(1));
    FA2 : full_adder PORT MAP(A => A(2), B => B(2), Cin => C(1), S => S(2), Cout => C(2));
    FA3 : full_adder PORT MAP(A => A(3), B => B(3), Cin => C(2), S => S(3), Cout => C(3));
    FA4 : full_adder PORT MAP(A => A(4), B => B(4), Cin => C(3), S => S(4), Cout => C(4));
    FA5 : full_adder PORT MAP(A => A(5), B => B(5), Cin => C(4), S => S(5), Cout => C(5));
    FA6 : full_adder PORT MAP(A => A(6), B => B(6), Cin => C(5), S => S(6), Cout => C(6));
    FA7 : full_adder PORT MAP(A => A(7), B => B(7), Cin => C(6), S => S(7), Cout => C(7));
    FA8 : full_adder PORT MAP(A => A(8), B => B(8), Cin => C(7), S => S(8), Cout => C(8));
    FA9 : full_adder PORT MAP(A => A(9), B => B(9), Cin => C(8), S => S(9), Cout => C(9));
    FA10 : full_adder PORT MAP(A => A(10), B => B(10), Cin => C(9), S => S(10), Cout => C(10));
    FA11 : full_adder PORT MAP(A => A(11), B => B(11), Cin => C(10), S => S(11), Cout => C(11));
    FA12 : full_adder PORT MAP(A => A(12), B => B(12), Cin => C(11), S => S(12), Cout => C(12));
    FA13 : full_adder PORT MAP(A => A(13), B => B(13), Cin => C(12), S => S(13), Cout => C(13));
    FA14 : full_adder PORT MAP(A => A(14), B => B(14), Cin => C(13), S => S(14), Cout => C(14));
    FA15 : full_adder PORT MAP(A => A(15), B => B(15), Cin => C(14), S => S(15), Cout => C(15));
    --P CALCULATION
    P(0) <= A(0) XOR B(0);
    P(1) <= A(1) XOR B(1);
    P(2) <= A(2) XOR B(2);
    P(3) <= A(3) XOR B(3);
    P(4) <= A(4) XOR B(4);
    P(5) <= A(5) XOR B(5);
    P(6) <= A(6) XOR B(6);
    P(7) <= A(7) XOR B(7);
    P(8) <= A(8) XOR B(8);
    P(9) <= A(9) XOR B(9);
    P(10) <= A(10) XOR B(10);
    P(11) <= A(11) XOR B(11);
    P(12) <= A(12) XOR B(12);
    P(13) <= A(13) XOR B(13);
    P(14) <= A(14) XOR B(14);
    P(15) <= A(15) XOR B(15);

    BP <= P(0) AND P(1)AND P(2)AND P(3)AND P(4)AND P(5)AND P(6)AND P(7)AND P(8)AND P(9)AND P(10)AND P(11)AND P(12)AND P(13)AND P(14)AND P(15);

    mux0 : mux2_1 PORT MAP(A => CIN, B => C(15), Sel => BP, Z => COUT);

END ARCHITECTURE rtl;