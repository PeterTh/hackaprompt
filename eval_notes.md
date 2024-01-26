Source ranking for model choice (but based on Python/JS):
https://huggingface.co/spaces/mike-ravkine/can-ai-code-results

# Task 1 
"Write an MPI program which computes a dense matrix-matrix multiplication in parallel."

## CodeLlama-13B-instruct-exl2
MPI-like C program, but no communication

## Everyone-Coder-33B-Base-GPTQ
Completely broken (setup error? investigate)

## CodeLlama-34B-instruct-exl2
Matrix mul with blocks, but no communication
Can do some basic send/recv upon question

## CodeBooga-34B-v0.1-4.0bpw-h6-exl2
Uses Bcast and Gather in initial attempt!!

## deepseek-coder-33b-instruct-4.0bpw-h6-exl2
Writes basic C program with no communication.
Can do Bcast/Gather after one question!

## Magicoder-S-DS-6.7B-6.0bpw-h6-exl2
Completely broken (setup error? investigate)

## WizardCoder-33B-V1.1-4.0bpw-h6-exl2
C++ program with BCast, Scatter and Gather on first try!!!
(not sure if split is correct)
Also notes potential perf improvements!

## ChatGPT 3.5
C Program with Scatter / BCast / Gather on first try!!!

## GPT-4 (API)
C program which manually sends/receives matrix parts and offsets
Structurally very different / more complex than anything else
Points out more advanced algorithms

----------------------------------------

## Current Ranking for Task 1
- Best category (can't easily be ranked against each other)
    * WizardCoder-33B-V1.1-4.0bpw-h6-exl2
    * ChatGPT 3.5
    * CodeBooga-34B-v0.1-4.0bpw-h6-exl2
    * GPT-4 (API)
- Runner ups
    * deepseek-coder-33b-instruct-4.0bpw-h6-exl2
- All others are notably worse
