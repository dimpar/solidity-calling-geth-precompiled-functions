# solidity-calling-geth-precompiled-functions

### calling a contract function from the truffle console:

```
<contract_name>.deployed().then....
```

```
$ Precompile.deployed().then(function(instance){precompile=instance})
$ precompile.fortyThree()
```