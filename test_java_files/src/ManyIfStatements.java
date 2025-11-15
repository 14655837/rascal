public class ManyIfStatements {
    public static void main(String[] args) {
        int score = 73;

        if (score < 0) {
            System.out.println("Invalid score: less than 0");
        }
        if (score == 0) {
            System.out.println("Zero score — needs improvement!");
        }
        if (score > 0 && score < 20) {
            System.out.println("Very poor performance");
        }
        if (score >= 20 && score < 40) {
            System.out.println("Below average performance");
        }
        if (score >= 40 && score < 50) {
            System.out.println("Barely passing");
        }
        if (score >= 50 && score < 60) {
            System.out.println("Average score");
        }
        if (score >= 60 && score < 70) {
            System.out.println("Above average");
        }
        if (score >= 70 && score < 80) {
            System.out.println("Good performance");
        }
        if (score >= 80 && score < 90) {
            System.out.println("Very good performance");
        }
        if (score >= 90 && score <= 100) {
            System.out.println("Excellent!");
        }
        if (score > 100) {
            System.out.println("Invalid score: greater than 100");
        }

        // More random examples of independent if statements
        if (score % 2 == 0) {
            System.out.println("Even score");
        }
        if (score % 2 != 0) {
            System.out.println("Odd score");
        }
        if (score > 50 && score % 5 == 0) {
            System.out.println("Nice multiple of 5 and over 50!");
        }
        if (score > 50 && score % 10 == 3) {
            System.out.println("Interesting ending in 3!");
        }
        if (score == 73) {
            System.out.println("Lucky number 73 detected!");
        }
        if (score != 73) {
            System.out.println("Not 73, maybe next time.");
        }

        // Dozens more for demonstration
        for (int i = 1; i <= 20; i++) {
            if (score > i * 3) {
                System.out.println("Score is greater than " + (i * 3));
            }
        }

        // Final condition check
        if (score > 60 && score < 80 && score % 3 == 1) {
            System.out.println("Custom match: between 60–80 and remainder 1 when divided by 3!");
        }

        System.out.println("Analysis complete.");
    }
}
