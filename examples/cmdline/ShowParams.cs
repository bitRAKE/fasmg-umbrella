using System;

namespace ShowParams
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("There are {0} program arguments", args.Length);

            foreach (string arg in args)
            {
                Console.WriteLine(arg);
            }
        }
    }
}