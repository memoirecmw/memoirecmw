<?php
// Récupérer les événements de la table 'event'
try {
    $stmt = $pdo->query("SELECT * FROM event");
    $events = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Erreur lors de la récupération des événements : " . $e->getMessage();
    exit;
}

// Formater les événements pour FullCalendar
$formattedEvents = [];
foreach ($events as $event) {
    $formattedEvents[] = [
        'title' => $event['nomEvent'],
        'start' => $event['dateDebutEvent'],
        'end' => $event['dateFinEvent'],
        'description' => $event['descriptionEvent'],
        // Ajoutez d'autres propriétés si nécessaire (couleur, etc.)
    ];
}

// Convertir le tableau en JSON
$eventsJson = json_encode($formattedEvents);
?>

<div class="calendar-container">
    <div id="fullcalendar"></div>
    <div id="event-details"></div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('fullcalendar');
    var eventDetailsEl = document.getElementById('event-details');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        events: <?php echo $eventsJson; ?>,
        eventRender: function(info) {
            // Ne pas afficher le titre dans la case de l'événement
        }
    });
    calendar.render();

    // Appeler displayEventDetails lors du chargement du calendrier
    displayEventDetails();

    function displayEventDetails() {
        var events = calendar.getEvents(); // Récupérer tous les événements du calendrier
        var currentMonth = calendar.getDate(); // Récupérer la date du mois affiché
        var monthEvents = []; // Tableau pour stocker les événements du mois

        events.forEach(function(event) {
            if (event.start.getMonth() === currentMonth.getMonth() && event.start.getFullYear() === currentMonth.getFullYear()) {
                monthEvents.push(event); // Ajouter l'événement au tableau
            }
        });

        eventDetailsEl.innerHTML = ''; // Effacer le contenu précédent

        monthEvents.forEach(function(event) {
            var day = event.start.getDate(); // Extraire le jour du mois
            eventDetailsEl.innerHTML += '<div class="eventRow"><div class="dayCircle"><span class="dayNumber">' + day + '</span></div><span class="eventTitle">' + event.title + '</span></div>'; // Afficher le jour et le titre
        });
    }
});
    </script>
    
