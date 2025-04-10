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

<div id="fullcalendar"></div>
<div id="event-titles"></div>

<script>
     document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('fullcalendar');
    var eventTitlesEl = document.getElementById('event-titles');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        events: <?php echo $eventsJson; ?>,
        eventRender: function(info) {
            // Ne pas afficher le titre dans la case de l'événement
        },
        eventClick: function(info) {
            displayEventTitle(info.event.title, info.event.start); // Passer le titre et la date
        }
    });
    calendar.render();

    function displayEventTitle(title, date) {
        // Formater la date (exemple)
        var formattedDate = date.toLocaleDateString('fr-FR'); // Format français
  eventTitlesEl.innerHTML = '<div class="monthEvent">' + formattedDate + ' - ' + title + '</div>';
    }
});
    </script>

