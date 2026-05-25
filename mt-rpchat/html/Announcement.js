Vue.component('announcement', {
    template: '#announcement_template',
    props: {
      templates: {
        type: Object,
      },
      args: {
        type: Array,
      },
      template: {
        type: String,
        default: null,
      },
      templateId: {
        type: String,
        default: CONFIG.defaultTemplateId,
      },
    },
    computed: {
      textEscaped() {
        let s = this.template ? this.template : this.templates[this.templateId];
  
        if (this.template) {
          this.templateId = -1;
        }
  
        if (this.templateId == CONFIG.defaultTemplateId && this.args.length == 1) {
          s = this.templates[CONFIG.defaultAltTemplateId];
        }
  
        s = s.replace(/{(\d+)}/g, (match, number) => {
          const argEscaped = this.args[number] != undefined ? this.escape(this.args[number]) : match;
          return argEscaped;
        });
  
        return this.colorize(s);
      },
    },
    methods: {
      colorize(str) {
        let s = "<span>" + (str.replace(/\^([0-9])/g, (str, color) => `</span><span class="color-${color}">`)) + "</span>";
  
        const styleDict = {
          '*': 'font-weight: bold;',
          '_': 'text-decoration: underline;',
          '~': 'text-decoration: line-through;',
          '=': 'text-decoration: underline line-through;',
          'r': 'text-decoration: none;font-weight: normal;',
        };
  
        const styleRegex = /\^(\_|\*|\=|\~|\/|r)(.*?)(?=$|\^r|<\/em>)/;
        while (s.match(styleRegex)) {
          s = s.replace(styleRegex, (str, style, inner) => `<em style="${styleDict[style]}">${inner}</em>`)
        }
  
        return s.replace(/<span[^>]*><\/span[^>]*>/g, '');
      },
      escape(unsafe) {
        return String(unsafe)
          .replace(/&/g, '&amp;')
          .replace(/</g, '&lt;')
          .replace(/>/g, '&gt;')
          .replace(/"/g, '&quot;')
          .replace(/'/g, '&#039;');
      },
    },
  });
  