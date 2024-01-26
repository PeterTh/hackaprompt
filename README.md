# Hackaprompt Planning

- [Basic Idea](#basic-idea)
- [Selection of, Interaction with and Access to LLMs](#selection-of-interaction-with-and-access-to-llms)
- [Pre- and Post-event surveys](#pre--and-post-event-surveys)
- [Group Sizes & Composition](#group-sizes--composition)
- [Open Points & Questions](#open-points--questions)

## Basic Idea
 * Groups of students work on HPC programming problems (of increasing difficulty) using LLMs
 * We provide a set of guildelines on how they are to interact with the LLMs, and e.g. how much they are allowed to do actual programming rather than prompting
 * We track the interactions as well as the quality of the outputs across groups and LLMs for later analysis

## Selection of, Interaction with and Access to LLMs
I believe we should select a set of LLMs that we have a priori verified to be at least somewhat
capable for the target applications. I have looked at several of the highest-ranked broadly
available LLMs and evaluated them on a basic introductory HPC-related task [here](eval_notes.md).

I propose that we select ~4-5 of these, and perhaps add one well-known and ostensibly 
worse-performing LLM as a lower anchor to validate the impact of LLM quality on student 
outcomes and thereby our methodology later. (One option for this would be CodeLlama-13B-instruct)

In terms of interaction, it be a good idea, in terms of scientific outcome, to perform a
**blind** experiement -- i.e. the students should preferably not be aware of which specific 
LLM they are interacting with for a given task. This would necessitate providing a unified
interface which removes all easily identifyable marks of which LLM is being used. This
could also track all the interactions of each group with the system.

For Access, for this purpose we would of course need API access to the commercial models,
as well as sufficient hosting for the non-commercial models. In my evaluation I ran the models
using the [exllamav2 inference engine](https://github.com/turboderp/exllamav2)
on a server with 4x Geforce RTX 3090s. One of those is more than sufficient in terms of
inference speed to host interactions for 3-4 groups. However, since most of the models are
33B-34B parameters we cannot host more than one model on a card at a time in terms of memory
usage (with ~4bpw quantization which seems to be the sweet spot).

## Pre- and Post-event surveys
It would be very informative both for the event itself and for the later evaluation to have all 
participating students fill out a pre- and post-survey.  
The pre-survey should cover:
 * Their (self-evaluated) proficiency with programming in general
 * Their (self-evaluated) proficiency with HPC development
 * Their amount of experience with LLMs in general, and in using them for development

## Group Sizes & Composition
Larger groups reduce the sample size for evaluating the utility of different LLMs substantially,
and could also reduce the learning experience for some of the individual students participating.
As such, I think groups of two or at most 3 students would be ideal.

For group composition, we could let students form groups on their own, which might be what they
prefer, or we could assemble the groups based on known factors/goals. I.e. we could prefer to
build mixed groups with students who are more or less experienced in HPC, or mix across Universities.

## Open Points & Questions
 * Should students be allowed to write any code themselves, or only prompt the LLM? 
    * Should we vary this across groups or tasks to evaluate the impact of LLM-assist vs. LLM-only?
 * How many tasks should each group work on? This also implies the **time limit** per tasks.  
   I think a fixed time limit per task is crucial to maintain comparability across tasks and models.
 * Should groups work on a given task using only one given LLM, or should the same group try to solve the same task with different LLMs in succession?
    * The latter would allow us to see whether there is a cross-LLM learning effect
