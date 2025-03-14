$(document).ready(function() {
    let timeoutIds = {}; // Stocker les IDs de délai pour chaque menu
    let isMouseOnMenus = {}; // Stocker l'état de la souris pour chaque menu

    $("ul[id$='-nav']").each(function() {
        let menuId = $(this).attr("id");
        let baseMenuId = menuId.replace("-nav", "");
        isMouseOnMenus[baseMenuId] = false;

        // Vérifier si la classe active-page est présente
        if ($(this).hasClass("active-page")) {
            $(this).css("visibility", "visible");
            $("#" + baseMenuId).css("background-color", "#779BDD");
        } else {
            // Comportement normal pour les autres pages
            $("#" + baseMenuId).mouseenter(function() {
                isMouseOnMenus[baseMenuId] = true;
                clearTimeout(timeoutIds[baseMenuId]);
                $("#" + menuId).stop(true, true).fadeIn(200).css("visibility", "visible");
                $("#" + baseMenuId).css("background-color", "#779BDD");
            });

            $("#" + baseMenuId).mouseleave(function() {
                isMouseOnMenus[baseMenuId] = false;
                timeoutIds[baseMenuId] = setTimeout(function() {
                    if (!isMouseOnMenus[baseMenuId] && !isMouseOnMenus[menuId]) {
                        $("#" + menuId).fadeOut(100);
                        $("#" + baseMenuId).css("background-color", "");
                    }
                }, 200);
            });

            $("#" + menuId).mouseenter(function() {
                isMouseOnMenus[menuId] = true;
                clearTimeout(timeoutIds[baseMenuId]);
                $("#" + baseMenuId).css("background-color", "#779BDD");
            });

            $("#" + menuId).mouseleave(function() {
                isMouseOnMenus[menuId] = false;
                timeoutIds[baseMenuId] = setTimeout(function() {
                    if (!isMouseOnMenus[baseMenuId] && !isMouseOnMenus[menuId]) {
                        $("#" + menuId).fadeOut(100);
                        $("#" + baseMenuId).css("background-color", "");
                    }
                }, 200);
            });
        }

        $("#" + baseMenuId).click(function() {
            $("#" + baseMenuId).css("background-color", "#779BDD");
        });
    });
});
document.addEventListener('DOMContentLoaded', function() {
    const textarea = document.getElementById('userNote');

    textarea.addEventListener('input', function() {
        const content = textarea.value;

        fetch('save.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `note=${encodeURIComponent(content)}`,
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const editableElements = document.querySelectorAll('[contenteditable="true"]');

    editableElements.forEach(element => {
        element.addEventListener('blur', function() {
            const id = this.dataset.id;
            const newName = this.textContent;
            const isGroup = this.tagName === 'H3';

            // Envoyer une requête AJAX pour mettre à jour le nom dans la base de données
            fetch('update_name.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `id=${id}&newName=${encodeURIComponent(newName)}&isGroup=${isGroup}`,
            });
        });
    });
});


// DROP AREA

document.addEventListener('DOMContentLoaded', function() {
    const dropArea = document.getElementById('drop-area');
    const fileInput = document.getElementById('fichier');
    const fileNameDisplay = document.getElementById('file-name');

    // Gestion du glisser-déposer
    if (dropArea) {
        dropArea.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropArea.classList.add('highlight');
        });

        dropArea.addEventListener('dragleave', (e) => {
            dropArea.classList.remove('highlight');
        });

        dropArea.addEventListener('drop', (e) => {
            e.preventDefault();
            dropArea.classList.remove('highlight');
            fileInput.files = e.dataTransfer.files;
            fileNameDisplay.textContent = fileInput.files[0].name; // Affichage du nom du fichier
        });
    }

    // Gestion de la sélection via le bouton
    if (fileInput) {
        fileInput.addEventListener('change', (e) => {
            if (fileInput.files.length > 0) {
                fileNameDisplay.textContent = fileInput.files[0].name; // Affichage du nom du fichier
            } else {
                fileNameDisplay.textContent = ''; // Effacer le nom si aucun fichier n'est sélectionné
            }
        });
    }
});


// NOTIFICATIONS BULLE 
function showNotification(message, type) {
    const notificationContainer = document.getElementById('notification-container');
    if (notificationContainer) { // Vérifie si l'élément existe
        notificationContainer.textContent = message;
        notificationContainer.className = 'notification ' + type;
        notificationContainer.style.opacity = 1;

        setTimeout(function () {
            notificationContainer.style.opacity = 0;
        }, 3000);
    } else {
        console.error('Notification container not found');
    }
}


// POP UP DOCUMENTATION
// JavaScript pour gérer la fenêtre pop-up
document.addEventListener('DOMContentLoaded', function() {
    const docLinks = document.querySelectorAll('.documentation-link');
    const popup = document.getElementById('popup');
    const popupContentInner = document.getElementById('popup-content-inner');
    const closeButton = document.querySelector('.close-button');
    const mainContentOverlay = document.createElement('div');

    mainContentOverlay.classList.add('main-content-overlay');
    document.body.appendChild(mainContentOverlay);

    docLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const docTitle = this.getAttribute('data-title');
            const docDescription = this.getAttribute('data-description');

            popupContentInner.innerHTML = `
                <div class="popup-title">${docTitle}</div>   
                <div class="popup-text">${docDescription}</div>
            `;
            popup.style.display = 'block';
            mainContentOverlay.style.display = 'block';
        });
    });

    closeButton.addEventListener('click', function() {
        popup.style.display = 'none';
        mainContentOverlay.style.display = 'none';
    });

    window.addEventListener('click', function(event) {
        if (event.target === mainContentOverlay) {
            popup.style.display = 'none';
            mainContentOverlay.style.display = 'none';
        }
    });
});