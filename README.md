# solidity-calling-geth-precompiled-functions

### calling a contract function from the truffle console:

```
<contract_name>.deployed().then....
```

```
$ Precompile.deployed().then(function(instance){precompile=instance})
$ precompile.fortyThree()
```

### solidity assembly
https://solidity.readthedocs.io/en/develop/assembly.html

```call(g, a, v, in, insize, out, outsize)``` - call contract at address a with input mem[in…(in+insize)) providing g gas and v wei and output area mem[out…(out+outsize)) returning 0 on error (eg. out of gas) and 1 on success

```staticcall(g, a, in, insize, out, outsize)``` identical to call(g, a, 0, in, insize, out, outsize) but do not allow state modifications