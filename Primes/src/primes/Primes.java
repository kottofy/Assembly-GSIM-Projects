/*
 * A program to calculate the first 200 prime numbers. Later converted to MIPS.
 */

package primes;

/**
 *
 * @author Kristin Ottofy
 */
public class Primes
{
    static int lower = 199;
    static int higher = 299;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args)
    {
        /**************** find primes *****************/
        for (int count = 0, i = 2; count < 200; i++)
        {
            int sqrt = sqrt(i);
            if (is_prime(i, sqrt) == 1)          // if it is a prime number
            {
                if (check_prime(i) == 1)   // if the number is in the range
                {
                    System.out.println(count+1 + " Range: " + i);
                }
                else
                {
                    System.out.println(count+1 + " Prime: " + i);
                }
                count++;
            }
        }
    }

    /*
     * 
     */
    public static int sqrt(int i)
    {
        int sqrt = 0;

        for (int p = 0; (p * p) <= i; p++)
        {
            sqrt = p;
        }

        //System.out.println("sqrt: " + sqrt);

        return sqrt;
    }


    /*
     * checks that num is prime
     */
    public static int is_prime(int i, int sqrt)
    {
        // loop through each number up to the floor of the sqrt of the upper
        // bound number, testing if num is divisible by i
        for (int q = 2; q <= sqrt; q++)
        {
            if (i % q == 0)
            {
                return 0;
            }
        }

        return 1;
    }

    /*
     * checks that num is in range
     */
    public static int check_prime(int i)
    {
        if (i >= lower)
        {
            if (i <= higher)
            {
                return 1;
            }
        }

        return 0;
    }
}
