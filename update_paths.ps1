# Script pour mettre à jour les chemins des ressources dans tous les fichiers HTML
$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" -Exclude "index.html", "photos_videos.html", "reseaux_sociaux.html"

foreach ($file in $htmlFiles) {
    Write-Host "Mise à jour des chemins dans $($file.Name)..."
    
    # Lire le contenu du fichier
    $content = Get-Content -Path $file.FullName -Raw
    
    # Mettre à jour les chemins des ressources
    $content = $content -replace 'href="symbole-acdc.png"', 'href="assets/images/symbole-acdc.png"'
    $content = $content -replace 'href="fansite.css"', 'href="assets/css/fansite.css"'
    $content = $content -replace 'src="Groupe acdc.jpg"', 'src="assets/images/Groupe acdc.jpg"'
    $content = $content -replace 'src="(photo\d+\.jpg)"', 'src="assets/images/$1"'
    $content = $content -replace 'src="(photo\d+\.jpeg)"', 'src="assets/images/$1"'
    $content = $content -replace 'src="(.*\.gif)"', 'src="assets/images/$1"'
    $content = $content -replace 'src="(logo-[^"]+\.png)"', 'src="assets/images/$1"'
    $content = $content -replace 'src="(Hells-Bells\.gif)"', 'src="assets/images/$1"'
    $content = $content -replace 'src="(.*\.mp4)"', 'src="assets/videos/$1"'
    
    # Écrire le contenu mis à jour dans le fichier
    Set-Content -Path $file.FullName -Value $content
    
    Write-Host "Terminé pour $($file.Name)"
}

Write-Host "Mise à jour des chemins terminée pour tous les fichiers HTML."
