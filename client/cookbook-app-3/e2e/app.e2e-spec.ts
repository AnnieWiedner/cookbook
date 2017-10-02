import { CookbookAppPage } from './app.po';

describe('cookbook-app App', () => {
  let page: CookbookAppPage;

  beforeEach(() => {
    page = new CookbookAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
