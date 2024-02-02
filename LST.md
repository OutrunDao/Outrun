# Bon LST
Bon生态系统中ETH有两种形式，NETH(Bon Ether)和PETH(Principal Ether)，此外还将引入ETH YieldNFT代表对质押的NETH的收益权。

## NETH
NETH是一种与ETH松散挂钩的稳定币，因此1个NETH始终代表1个ETH，并且NETH在流通中的数量与Bon ETH系统中的ETH数量相匹配。单独持有NETH并不符合获得抵押收益的条件，应该将其视为持有ETH的类比。NETH挂钩率定义为在1.00汇率的两侧各1％，这意味着为了保持1个NETH兑换1.01-0.9900 ETH的汇率。

## PETH
PETH是NETH的质押本金代币，旨在积累Blast产生的原生收益并释放锁仓的流动性。用户随时可以将NETH质押锁定指定的时间并铸造PETH与YieldNFT，随着时间的推移，用户可以不断获得原生质押收益。相应数量的NETH被铸造并添加到储蓄库中，使用户可以获得比存入时更多的NETH。在锁定时间到期后可以销毁PETH以赎回质押的NETH
注意：PETH为本金代币，产生的质押收益由YieldNFT管理

## ETH YieldNFT
ETH YieldNFT代表对质押的NETH的收益权，通过锁仓质押NETH获得。YieldNFT将ETHN的质押收益剥离。持有YieldNFT即可享有未来的原生收益。每个YieldNFT中记录了对应锁定仓位的ETH数量，和解锁时间，到期后可以销毁YieldNFT赎回该仓位的原生收益。YieldNFT可以在二级市场上交易