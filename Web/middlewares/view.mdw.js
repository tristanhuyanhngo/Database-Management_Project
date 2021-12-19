import { engine } from 'express-handlebars';
import hbs_sections from 'express-handlebars-sections';
import numeral from 'numeral';

import { dirname } from 'path';
import { fileURLToPath } from 'url';
import path from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));

export default function (app) {
    app.engine('hbs', engine({
        defaultLayout: 'layout.hbs',
        helpers: {
            format_number(val) {
                return numeral(val).format('0,0');
            },
            section: hbs_sections()
        }
    }));
    app.set('view engine', 'hbs');
    app.set('views', [path.join(__dirname,'/views'), path.join(__dirname,'/components')]);
}
