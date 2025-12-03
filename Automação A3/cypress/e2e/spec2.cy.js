import { slowCypressDown } from 'cypress-slow-down'

slowCypressDown()

describe('teste de cadastro de atendimento', () => {
  it('cadastrado com sucesso', () => {
    cy.visit('http://localhost/projetoA3(2)/view/')
    cy.get('#username').type('marco')
    cy.get('#senha').type('12345')
    cy.get('.btn').click()
    cy.get('.swal2-confirm').click()
    cy.get(':nth-child(2) > .card > .card-body > .btn').click()

    cy.get('.btn-success').click()
    cy.get('#idFormaAtendimento').select('Whatsapp')
    cy.get('#idpublico').select('Trabalhador')
    cy.get('#idUsuario').select('marco')
    cy.get('#ativo').select('Sim')
    cy.get('#respostaAtendimento').type(
  'Nome: carlos gabriel\n' +
  'CPF: 055-762-840-04\n' +
  'Telefone: (51) 996589349')
  cy.get('.btn-success').click()
  cy.get('.swal2-confirm').click()
  cy.get(':nth-child(2) > .card > .card-body > .btn').click()
  cy.contains('carlos')  
  })
})