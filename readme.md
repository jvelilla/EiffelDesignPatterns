Original source http://se.inf.ethz.ch/old/people/arnout/patterns/
From Patterns to Components

by Karine Arnout

Ph.D. dissertation presented to the Swiss Institute of Technology, Zurich (ETH Zurich) for the degree of Doctor of Sciences on March 31, 2004.
Accepted on the recommendation of Prof. Dr. Bertrand Meyer (examiner), Prof. Dr. Peter Müller and Prof. Dr. Emil Sekerinski (co-examiners).

Thesis

Ensuring trust into the software has become more and more important over the past few years with the spread of computers everywhere. Computers (and software) are not limited to the domains of computer science anymore. They are present in a variety of applications ranging from mobile phones and ATM machines to cars and satellites. They are widely used in mission-critical and even life-critical systems like health- care devices, airplanes, trains, missiles, etc. Hence quality is paramount. This is the "Grand Challenge of Trusted Components" that Bertrand Meyer describes.

This work takes up the challenge and contributes a few new high-quality (trusted) components. I am using Bertrand Meyer’s definition of component: for me, a software component is a reusable software element, typically some library classes, usually in source form (not binary form), which differs from Clemens Szyperski’s view of components.

Starting from one design pattern (the Observer), I reviewed all patterns described in the book by Gamma et al. to evaluate their componentizability and build the corresponding software component whenever applicable. The working hypothesis is that Design patterns are good but components are better. Indeed, patterns have many beneficial consequences: they provide a repository of knowledge (design ideas) that newcomers can learn and apply to their software, yielding better architectures; they provide a common vocabulary that facilitates exchanges between programmers and managers, etc. But patterns are not reusable as code: developers must implement them anew for each application, which is a step backward from reuse. The motivation of this thesis was to provide users with a "pattern library", a set of components capturing the intent of the underlying design patterns that they can reuse directly. I call "componentization" this process of transforming patterns into components.

The first pattern analysis - targeting the Observer pattern - was also the first successful "componentization": it resulted in the Event Library, covering the Observer pattern and the general idea of publish-subscribe and event-driven development. Other successful stories followed, including a Factory Library (chapter 8), a Visitor Library (chapter 9), and a Composite Library (chapter 10). To prove the usability of such "componentized" versions of design patterns, I modified an existing Eiffel tool (Gobo Eiffel Lint) that was extensively relying on the Visitor pattern to use the Visitor Library; the experience (reported in section 9.3) was successful.

Several object-oriented mechanisms of Eiffel proved useful to componentize patterns: genericity (constrained and unconstrained), multiple inheritance, agents. The support for Design by Contract(TM) was also a key to the success of this work.

Because this thesis relies on some mechanisms that are specific to the Eiffel language, the resulting components are also - for some of them - Eiffel-specific. This is a limitation. However, the "componentization" process per se is not Eiffel- specific and one can imagine having a Composite Library or a Chain of Responsibility Library written in C# as soon as C# supports genericity.

Nevertheless, a few patterns resisted my attempt at componentiation. Some are too much context-dependent, hence not componentizable. Some require context information but this information can be filled in by the user through "skeleton" classes. For patterns of the second category, I developed a Pattern Wizard to generate skeletons automatically and make it easier to programmers to apply these patterns by avoiding writing code as much as possible.

I expect my work to be a "little bit" that will count to build more reliable software and contribute to the "Grand Challenge of Trusted Components".