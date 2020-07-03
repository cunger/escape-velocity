---
title: "Blockchain"
summary: "..."
date: 2020-01-25
weight: 8
math: false
toc: true
draft: true
---

BlockChain

Block:

  BlockHeader:
    PrevBlockHash
    MerkleRoot
    Nonce (proof of work)
    Timestamp

  BlockSize

  TransactionCount

  Transactions
    UTXO model

--> genesis block
--> blockchain.append(block)

P2P Network, blockchain stored on each node

--> when Node logs in, it needs to ask for the latest block(s) or the whole blockchain

> A third generation of distributed ledger technology has emerged, one which sees innovation in blockless data structures. Nano and IoTA use Directed Acyclic Graphs (DAG) to significantly improve transaction throughput compared to blockchain architectures. Hashgraph uses a different blockless architecture to achieve significant throughput.
Still, current distributed ledger protocols remain vertically scalable, but do not scale horizontally. In each case, adding more nodes to the network does not increase throughput or capacity. The scalability issue remains unsolved, and major advances and adoption will require a basic rethinking of technical approaches.
