// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import { themes as prismThemes } from 'prism-react-renderer';

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'LangChain.dart',
  tagline: 'LangChain.dart Docs',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://beta.langchaindart.dev/',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'davidmigloz', // Usually your GitHub org/user name.
  projectName: 'langchain_dart', // Usually your repo name.

  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: './sidebars.js',
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          editUrl:
            'https://github.com/davidmigloz/langchain_dart/tree/main/docs_v2/',
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      // Replace with your project's social card
      image: 'img/langchain.dart.png',
      navbar: {
        title: 'LangChain.dart',
        logo: {
          alt: 'LangChain Logo',
          src: 'img/favicon.ico',
        },
        items: [
          {
            to: '/docs/integrations',
            position: 'left',
            label: 'Integrations',
          },
          {to: 'https://blog.langchaindart.dev/blog', label: 'Blog', position: 'left'},
          {
            href: 'https://github.com/davidmigloz/langchain_dart/',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Docs',
            items: [
              {
                label: 'Tutorial',
                to: '/docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Discord',
                href: 'https://discord.gg/x4qbhqecVR',
              },
              {
                label: 'pub.dev',
                href: 'https://pub.dev/packages/langchain',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Blog',
                to: '/blog',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/davidmigloz/langchain_dart',
              },
            ],
          },
        ],
        copyright: `Made with 💙 by the <a href="https://github.com/davidmigloz/langchain_dart/graphs/contributors" target="_blank" rel="noopener noreferrer">LangChain.dart Community</a>`,
      },
      prism: {
        theme: prismThemes.vsLight,
        darkTheme: prismThemes.vsDark,
        additionalLanguages: ['yaml','dart','bash'],
      },
    }),
};

export default config;
