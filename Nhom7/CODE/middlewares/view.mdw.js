import { engine } from 'express-handlebars';
import hbs_sections from 'express-handlebars-sections';
import numeral from 'numeral';
import moment from 'moment';

export default function (app) {
    app.engine('hbs', engine({
        defaultLayout: 'layout.hbs',
        helpers: {
            format_number(val) {
                return numeral(val).format('0,0');
            },
            format_date(val) {
                return moment(val).format('DD-MM-YYYY, h:mm');
            },
            section: hbs_sections()
        }
    }));
    app.set('view engine', 'hbs');
    app.set('views', './components');
}
