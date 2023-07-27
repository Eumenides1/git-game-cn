public class Main {
    public static void main(String[] args) {
        String[] strArray = {"Hello", "World", null, "Java"};
        for (int i = 0; i < strArray.length; i++) {
            try {
                System.out.println(strArray[i].length());
            } catch (NullPointerException e) {
                System.err.println("Caught NullPointerException: " + e.getMessage());
            }
        }
    }
}