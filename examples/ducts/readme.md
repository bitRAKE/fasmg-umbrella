### Duct
Create a simple file processor using pipes and redirection through the command line. When both input and output are constrained in this way, I call it a *Duct*. Ducts are not meant to be interacted with, but rather a refined tool to be integrated in command scripts.

#### Transforms
Transforms try to create greater predictability  in the data. This predictability is in relation to the following steps ability to extract that predictability .

#### Entropy Coders


These algorithms are often referred to as "Statistical Coding" or "Entropy Coding" techniques. They work by creating a model of the data, where each unit (bit, byte, word, etc.) is associated with a probability distribution. These methods then use this model to create a more compact representation of the data. They typically operate on the principle that more frequent data patterns should be assigned shorter codes, while less frequent patterns get longer codes.

Here's a breakdown of the methods you've mentioned:

1. Run-Length Encoding (RLE): This is a simple form of data compression where runs of data are stored as a single data value and a count. It's best suited for data with large amounts of repeated information, like simple graphic files or plain text.

2. Huffman Coding: A variable-length prefix coding algorithm that is used for lossless data compression. It uses a specific method for choosing the representation for each symbol, resulting in a prefix code (that is, the bit string representing some particular symbol is never a prefix of the bit string representing any other symbol) that expresses the most common characters using shorter strings of bits than are used for less common source symbols.

3. LZ*: Refers to Lempel-Ziv algorithms, such as LZ77 and LZ78. These are dictionary-based algorithms, where the dictionary is simply a portion of the previously-encoded input. When a repeating pattern is found, a pair (distance to the previous occurrence, length of the match) is encoded instead of a literal string.

4. Range/Arithmetic Coding: These are more advanced and efficient techniques that encode an entire message into a single number, a fraction between zero and one. Their advantage over simpler methods like Huffman coding is that they deal effectively with symbol probabilities that are not exact powers of two.

5. Sequitur: This algorithm, created by Craig Nevill-Manning and Ian Witten, is a method for constructing a grammar from a sequence of input symbols. It's an incremental, linear time and space, online algorithm that builds a hierarchical structure, or context-free grammar, from the input. The algorithm maintains two key properties as it processes the data: every digram (pair of symbols) is unique and each rule is used more than once. If at any point these properties are violated, rules are created, replaced, or deleted to restore them. This method allows Sequitur to effectively find and encode repeating subsequences in the data, which can then be compressed more easily.

6. PAQ6: This is part of a series of archivers in the PAQ series, developed by Matt Mahoney. PAQ6, and PAQ series in general, represents a category of compressors known as context mixing algorithms. Context mixing is a type of statistical data compression algorithm that combines predictions from multiple models – the "contexts" – to generate a probability distribution for the next symbol in the input data. PAQ6 employs several models, and it uses an artificial neural network to combine their outputs into a single prediction. The prediction is then encoded using arithmetic coding. It is computationally intensive but provides high compression ratios. 

So in essence, these algorithms are used to exploit statistical redundancy in the data, replacing larger or less predictable data patterns with smaller, more predictable ones based on the statistical model of the input. They aim to minimize the average code length, thereby maximizing the compression rate.

