import java.util.Random;
import java.util.Scanner;
class Main {
  
  public static void main(String[] args) {
    Random rand = new Random();
//Declaring our arrays
    String[] prefix = {"non", "mis", "semi", "ant-", "pre", "super", "semi", "inter", "fore", "un"};
    String[] suffix = {"ed", "er", "est", "ful", "ing", "less", "ly", "ment", "ness", "y"};
    String[] roots = {"auto", "chrom", "dyna", "hydr", "graph", "morph", "phon", "pdeudo", "mort", "spect"};
//Declaring definition arrays
    String[] prefixDef = {"something that is not ", "the incorrect ", "half or partly ", "against/opposite ", "before ", "above or beond ", "half or partly ", "between or among ", "before or 'pre' ", "not/opposite of "};
    String[] suffixDef = {"Past tense verb/adjective for ", "The act of being more than ", "The act of being the most ", "The act of being full of ", "Present participle of ", "The act of being without and ", "How something is ", "A state or act of being ", "The state/condition of ", "Characterized by how it is "};
    String[] rootsDef = {"self.", "time.", "power.", "water.", "writing.", "form or shape.", "sound.", "false/falsehood.", "death.", "looking/to look."};
    
//Getting the number of words the user wants us to create
    System.out.println("Welcome to the new word generator! Enter how many random words you want to create (limit is 100): ");
    Scanner scanner = new Scanner(System.in);
    int answer = scanner.nextInt();
    scanner.close();
    
    if (answer > 100) {
      System.out.println("Please enter a number lower than 101.");
      
    } else {
      
//Selecting a random string from our array
  for(int i = 0; i < answer; i++) {
    int index1 = rand.nextInt(prefix.length);
    String prefixRand = prefix[index1];
    String prefixRandDef = prefixDef[index1];
    int index2 = rand.nextInt(suffix.length);
    String suffixRand = suffix[index2];
    String suffixRandDef = suffixDef[index2];
    int index3 = rand.nextInt(roots.length);
    String rootRand = roots[index3];
    String rootRandDef = rootsDef[index3];

    System.out.println(prefixRand + "-" + rootRand + "-" + suffixRand + " --> " + prefixRand + rootRand + suffixRand);
    System.out.println(suffixRandDef + prefixRandDef + rootRandDef);

      }
    }
  }
}