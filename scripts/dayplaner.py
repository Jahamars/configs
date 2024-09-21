import os
from icalendar import Calendar
from datetime import datetime

# Путь к папке с заметками Obsidian
obsidian_dir = "/home/freedom/Документы/Obsidian/days"

# Путь к файлу .ics
ics_file = "/mnt/data/2024-09-02 07-19 ModeusCalendar 02 сент.—08 сент. 13 events.ics"

# Чтение файла .ics
with open(ics_file, 'r', encoding='utf-8') as f:
    calendar = Calendar.from_ical(f.read())

# Обработка каждого события в файле .ics
for event in calendar.walk('VEVENT'):
    summary = event.get('SUMMARY')
    dtstart = event.get('DTSTART').dt
    dtend = event.get('DTEND').dt
    location = event.get('LOCATION', "Место не указано")

    # Форматирование даты для имени файла Obsidian
    date_str = dtstart.strftime("%Y-%m-%d")
    file_path = os.path.join(obsidian_dir, f"{date_str}.md")
    
    # Проверка, существует ли файл для данной даты, если нет, то создание файла
    if not os.path.exists(file_path):
        with open(file_path, 'w', encoding='utf-8') as note:
            note.write(f"# План на {date_str}\n\n")
    
    # Форматирование времени, события и места
    time_range = f"{dtstart.strftime('%H:%M')} - {dtend.strftime('%H:%M')}"
    formatted_event = f"- [ ] {time_range} {summary} ({location})"

    # Добавление события в файл
    with open(file_path, 'a', encoding='utf-8') as note:
        note.write(f"{formatted_event}\n")
