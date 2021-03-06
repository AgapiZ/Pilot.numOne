# Pilot.numOne


ΔΠΜΣ Τέχνες και Τεχνολογίες Ήχου (Ιόνιο Πανεπιστήμιο)
Ακ. Έτος 2020-21
«Μουσική Πληροφορική» - Διδάσκων: Ιωάννης Ζάννος
Τίτλος Εργασίας: «Pilot.numOne» - Αγάπη Ζάρδα

Ο τίτλος της τελικής μου εργασίας αποκαλύπτει τον σκοπό της σύνθεσής της. Πρόκειται για έναν «πιλότο»  ή «οδηγό» με υλικά και τεχνικές του περιβάλλοντος προγραμματισμού «SuperCollider». Βασική προσωπική επιδίωξη είναι η ενσωμάτωση αυτών, στην καλλιτεχνική, ηχητική δημιουργία και έρευνα. 
Η κεντρική ιδέα της δομής της εργασίας, εκκινεί από το ερώτημα του, πώς θα μπορούσα να χρησιμοποιήσω τεχνικές και μεθόδους, ώστε το συγκεκριμένο περιβάλλον προγραμματισμού, να αποτελεί  ένα εργαλείο παραγωγής, σύνθεσης και σχεδιασμού ήχου αλλά και ένα real - time «πεδίο δράσης» με γνώμονα τον ελεύθερο αυτοσχεδιασμό και την αλληλόδραση υποκειμένου – ήχου – μηχανής. 
Γι΄αυτούς τους λόγους αποφάσισα το «σχεδίασμα» της σύνθεσης να διακρίνεται από τρεις ενότητες:

- αναπαραγωγή προ- ηχογραφημένων ηχοτοπίων/ ηχητικών δειγμάτων και έλεγχος (buffers)
- παραγωγή ήχου μέσω της πληροφορίας MIDI
- εισαγωγή ήχου και live επεξεργασία  (2 inputs : 0 = contact mic, 1 = circuit)

Καθώς, ήταν η πρώτη φορά που ασχολήθηκα σχολαστικά με το συγκεκριμένο περιβάλλον προγραμματισμού – εκτός από τις παρουσιάσεις, τις σημειώσεις του μαθήματος, αλλά και τη στοχευμένη καθοδήγηση του διδάσκοντα αναφορικά με την εργασία μου – ανέτρεξα στις εξής πηγές:
- Super Collider Documentation home,  (documentation ) ώστε να ανακαλύψω βασικές λειτουργίες των διαφόρων στοιχείων

- A Gentle Intro to SC, Ruviaro, B. (2014). A Gentle Introduction to SuperCollider. 
Σε αυτό το εγχειρίδιο βρήκα πληροφορίες  και απλές εντολές που με βοήθησαν στη σύνθεση (π.χ. .set, .fork, buffers, κ.α.)

- Online tutorials του Eli Fieldsteel, Eli_F    
Σε αυτά τα tutorials εστίασα στο πώς εισάγω ήχο στο SC (SoundIn) μέσω μικροφώνων, στα Synth, SynthDef και MIDIIn.

- οποιαδήποτε αναζήτηση έκανα στο google, συνήθως διάβαζα από 
https://scsynth.org/

Η εργασία αυτή, βρίσκεται τεχνικά αλλά και καλλιτεχνικά, υπό εξέλιξη. Σχετικά με το τεχνικό κομμάτι, το επόμενο βήμα αφορά τον έλεγχο των, επιθυμητών κάθε φορά, παραμέτρων μέσω controller. Επίσης, τη χρήση της τυχαίας επιλογής ηχητικών δειγμάτων (.choose.bufnum), ώστε να ενταχθεί στη σύνθεση. Αισθητικά, για αρχή θα ήθελα να κάνω περισσότερη ηχητική έρευνα χρησιμοποιώντας διάφορα υλικά επάνω στην κάψα του μικροφώνου επαφής. Ο στόχος σε αυτή την πηγή ήχου, είναι η παραγωγή διαφόρων «μικροήχων» που ενισχύονται και διαμορφώνονται μέσα από το αντίστοιχο Synth. Έπειτα, να δομήσω με σαφήνεια τις δράσεις και του προγράμματος, αλλά και τις δικές μου, δηλαδή, να συνθέσω τις τρεις ενότητες, έτσι ώστε να έχει κάποιο αισθητικό κριτήριο, να έχει κάποιο νόημα.
Κάνοντας ένα μικρό αναστοχασμό, θεωρώ πως, μέσω του μαθήματος κατάφερα να κάνω μια πρώτη ουσιαστική προσεγγίση σε αυτό το εργαλείο, που θα με βοηθήσει στην εξέλιξη της διαδικασίας και έρευνας της ηχητικής δημιουργίας. 

Κάποιοι πρώτοι αυτοσχεδιασμοί με τα υλικά:
https://drive.google.com/drive/folders/1Mr1dKQ6un1UxW45a3MQ__cjSwOVeYI4v?usp=sharing
