Eiffel Pattern library and tools, version 1.0

My work takes up the "Grand Challenge of Trusted Components" described by 
Bertrand Meyer and contributes a few new high-quality (trusted) components
(reusable software elements). I reviewed all patterns described in the book
by Gamma et al. to evaluate their "componentizability" and I built the 
corresponding software component whenever applicable. This package is the 
result of this "componentization" work.

It contains a battery of reusable Eiffel components developed with quality
in mind and making extensive use of contracts. I call “Pattern Library” this
set of trusted components built upon the description and intent of design
patterns. For the moment, this Pattern Library is restricted to patterns
described in the book "Design Patterns: Elements of Reusable Object-Oriented
Software", by Gamma et al. but the analysis and “componentization” process do
not restrict to those. The idea is to extend this component repository with
other widely used patterns.

This package also contains pattern implementation examples for the patterns
that could not be turned into reusable components and for componentizable 
patterns as well (in case you would be interested in comparing both versions
or you need a more customized pattern implementation and cannot use the library 
version).

The software included in this package is copyrighted freeware distributed
under the terms and conditions of the Eiffel Forum License version 2 as
specified in file License.txt.

It requires the ISE Eiffel compiler (version 5.4 or later) as specified in
file Release_notes.txt.

The official site for description and stable releases of the Eiffel Pattern
library and tools is located at http://se.inf.ethz.ch/people/arnout/patterns/. 

This package consists of thirteen Eiffel libraries:

    . Builder Library
    . Chain of Responsibility Library
    . Command Library (2 versions)
    . Composite Library (4 versions)
    . Event Library
    . Factory Library
    . Flyweight Library
    . Mediator Library
    . Memento Library
    . Proxy Library
    . State Library
    . Strategy Library (2 versions)
    . Visitor Library

and one utility:

    . Pattern Wizard

plus sample code for each library and for all design patterns described in
the "Design Patterns" book by Gamma et al.

The software provided in this distribution should work on any platform
where the ISE Eiffel compiler is available. However this software has only
been tested under Windows XP.

To install this package under Windows, please follow the instructions below:

    . Download the package patterns_1_0.zip
    . Copy the files to a directory of your choice on your disk and
      set the environment variable PATTERN to that directory, known as
      the distribution directory. Also make sure that the environment
      variable ISE_EIFFEL is set to the installation directory of the
      ISE Eiffel distribution.

In this distribution:

    bin                                                                        Executable of the Pattern Wizard
    src/example/library/builder/three_part                                     Example using the Builder Library (three-part builder version)
    src/example/library/builder/two_part                                       Example using the Builder Library (two-part builder version)
    src/example/library/chain_of_responsibility                                Example using the Chain of Responsibility Library
    src/example/library/command/auto_executable                                Example using the Command Library (auto-executable command version)
    src/example/library/command/history_executable                             Example using the Command Library (history-executable command version)
    src/example/library/composite/safety                                       Example using the Composite Library (safety version)
    src/example/library/composite/transparency                                 Example using the Composite Library (transparency version)
    src/example/library/event                                                  Example using the Event Library
    src/example/library/factory                                                Example using the Factory Library
    src/example/library/flyweight                                              Example using the Flyweight Library
    src/example/library/mediator                                               Example using the Mediator Library
    src/example/library/memento                                                Example using the Memento Library
    src/example/library/proxy                                                  Example using the Proxy Library
    src/example/library/state                                                  Example using the State Library
    src/example/library/strategy/agents                                        Example using the Strategy Library (version with agents)
    src/example/library/strategy/genericity                                    Example using the Strategy Library (version with genericity)
    src/example/library/visitor                                                Example using the Visitor Library
    src/example/pattern/non_componentizable/adapter/class_adapter              Example implementation of the Class Adapter pattern
    src/example/pattern/non_componentizable/adapter/object_adapter             Example implementation of the Object Adapter pattern
    src/example/pattern/non_componentizable/bridge/effective_classes           Example implementation of the Bridge pattern using only effective classes
    src/example/pattern/non_componentizable/bridge/deferred_classes            Example implementation of the Bridge pattern using deferred and effective classes
    src/example/pattern/non_componentizable/bridge/inheritance                 Example implementation of the Bridge pattern using non-conforming inheritance
    src/example/pattern/non_componentizable/decorator                          Example implementation of the Decorator pattern
    src/example/pattern/non_componentizable/facade                             Example implementation of the Facade pattern
    src/example/pattern/non_componentizable/interpreter                        Example implementation of the Interpreter pattern
    src/example/pattern/non_componentizable/singleton                          Example implementation of the Singleton pattern
    src/example/pattern/non_componentizable/template_method/pattern            Example implementation of the Template Method pattern
    src/example/pattern/non_componentizable/template_method/agents             Example implementation of the Template Method pattern using agents
    src/example/pattern/componentizable/abstract_factory                       Example implementation of the Abstract Factory pattern
    src/example/pattern/componentizable/builder                                Example implementation of the Builder pattern
    src/example/pattern/componentizable/chain_of_responsibility                Example implementation of the Chain of Responsibility pattern
    src/example/pattern/componentizable/command/auto_executable                Example implementation of the Command pattern with auto-executable commands
    src/example/pattern/componentizable/command/history_executable             Example implementation of the Command pattern with history-executable commands
    src/example/pattern/componentizable/composite/safety                       Example implementation of the Composite pattern (safety version)
    src/example/pattern/componentizable/composite/safety_with_parent           Example implementation of the Composite pattern (safety version with components knowing about their parent)
    src/example/pattern/componentizable/composite/transparency                 Example implementation of the Composite pattern (transparency version)
    src/example/pattern/componentizable/composite/transparency_with_parent     Example implementation of the Composite pattern (transparency version with components knowing about their parent)
    src/example/pattern/componentizable/factory_method                         Example implementation of the Factory Method pattern
    src/example/pattern/componentizable/flyweight                              Example implementation of the Flyweight pattern
    src/example/pattern/componentizable/mediator/pattern                       Example implementation of the Mediator pattern
    src/example/pattern/componentizable/mediator/event_library                 Example implementation of the Mediator pattern using the Event library
    src/example/pattern/componentizable/memento                                Example implementation of the Memento pattern
    src/example/pattern/componentizable/observer                               Example implementation of the Observer pattern
    src/example/pattern/componentizable/proxy                                  Example implementation of the Proxy pattern
    src/example/pattern/componentizable/state                                  Example implementation of the State pattern
    src/example/pattern/componentizable/strategy                               Example implementation of the Strategy pattern
    src/example/pattern/componentizable/visitor                                Example implementation of the Visitor pattern
    src/library/builder                                                        Builder Library classes
    src/library/chain_of_responsibility                                        Chain of Responsibility Library classes
    src/library/command                                                        Command Library classes
    src/library/composite                                                      Composite Library classes
    src/library/event                                                          Event Library classes
    src/library/factory                                                        Factory Library classes
    src/library/flyweight                                                      Flyweight Library classes
    src/library/mediator                                                       Mediator Library classes
    src/library/memento                                                        Memento Library classes
    src/library/proxy                                                          Proxy Library classes
    src/library/state                                                          State Library classes
    src/library/strategy                                                       Strategy Library classes
    src/library/visitor                                                        Visitor Library classes
    src/wizard                                                                 Pattern Wizard source code
    thesis                                                                     Text of my Ph.D. thesis "From Patterns to Components"

The complete text of my thesis (in PDF) is also available on the Web at
http://se.inf.ethz.ch/people/arnout/patterns/. Check it out regularly for code
updates, bug fixes, workarounds, and new releases. 

Although the license allows you to do pretty much whatever you want with
this software, I would be grateful to get your feedbacks, bug reports
and/or bug fixes, improvements, etc. so that others could benefit from
your work and ideas as well. I would also be interested in hearing about
your projects and how easy (or difficult) it was to adapt this software
for your specific needs. Thank you in advance.

Contact:

    Karine Arnout
    mailto: Karine.Arnout@inf.ethz.ch
    http://se.inf.ethz.ch/people/arnout

--
Copyright (c) 2002-2004, ETH Zurich, Switzerland
15 March 2004
