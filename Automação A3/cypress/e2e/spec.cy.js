import { slowCypressDown } from 'cypress-slow-down'

slowCypressDown()

describe('teste de cadastro de usuario', () => {
  it('cadastrado com sucesso', () => {
    cy.visit('http://localhost/projetoA3(2)/view/')
    cy.get('#username').type('marco')
    cy.get('#senha').type('12345')
    cy.get('.btn').click()
    cy.get('.swal2-confirm').click()
    cy.get(':nth-child(1) > .card > .card-body > .btn').click()
    
    cy.get('.btn-success').click()
    cy.get('#nomeUsuario').type('felipe')
    cy.get('#emailUsuario').type('felipe@gmail.com')
    cy.get('#loginUsuario').type('felipe')
    cy.get('#senhaUsuario').type('12345')
    cy.get('#telefoneCelular').type('5199235648')
    cy.get('#ativo').select('Sim')  
   
    cy.get('.btn-success').click()
    cy.get('.swal2-confirm').click()
    cy.get(':nth-child(1) > .card > .card-body > .btn').click()
    cy.contains('felipe')

  })
})