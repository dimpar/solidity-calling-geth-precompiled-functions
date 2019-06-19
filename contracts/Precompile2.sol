pragma solidity ^0.5.4;

interface Precompile2 {
    function foo(bytes32, uint8, bytes32, bytes32) public returns (address);
}

contract TestContract {
    address last = 0x0;

    event Debug(string message, address res);

    Precompile2 prec = Precompile2(0x0000000000000000000000000000000000000001);

    function testMe() public {
        last = prec.foo("\x00", uint8(0), "\x00", "\x00");
        // prec.foo("\x00", uint8(0), "\x00", "\x00");
        Debug("testMe()", last);
    }

}