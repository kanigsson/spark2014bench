(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort character 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (character character) Bool)

(declare-const dummy character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort tTglobSP1 0)

(declare-fun tTglobSP1qtint (tTglobSP1) Int)

;; tTglobSP1'axiom
  (assert
  (forall ((i tTglobSP1))
  (and (<= 1 (tTglobSP1qtint i)) (<= (tTglobSP1qtint i) 26))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 26)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tTglobSP1 tTglobSP1) Bool)

(declare-const dummy1 tTglobSP1)

(declare-datatypes ((tTglobSP1__ref 0))
(((tTglobSP1__refqtmk (tTglobSP1__content tTglobSP1)))))
(define-fun tTglobSP1__ref_tTglobSP1__content__projection ((a tTglobSP1__ref)) tTglobSP1 
  (tTglobSP1__content a))

(declare-sort tTmy_s4SP1 0)

(declare-fun tTmy_s4SP1qtint (tTmy_s4SP1) Int)

;; tTmy_s4SP1'axiom
  (assert
  (forall ((i tTmy_s4SP1))
  (and (<= 1 (tTmy_s4SP1qtint i)) (<= (tTmy_s4SP1qtint i) 4))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tTmy_s4SP1 tTmy_s4SP1) Bool)

(declare-const dummy2 tTmy_s4SP1)

(declare-datatypes ((tTmy_s4SP1__ref 0))
(((tTmy_s4SP1__refqtmk (tTmy_s4SP1__content tTmy_s4SP1)))))
(define-fun tTmy_s4SP1__ref_tTmy_s4SP1__content__projection ((a tTmy_s4SP1__ref)) tTmy_s4SP1 
  (tTmy_s4SP1__content a))

(declare-fun pack__a4__my_s4__aggregate_def (Int) (Array Int character))

(define-fun dynamic_invariant ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range temp___expr_74)))

;; def_axiom
  (assert
  (forall ((temp___568 Int))
  (=> (dynamic_invariant temp___568 true true true true)
  (forall ((temp___569 Int))
  (= (to_rep (select (pack__a4__my_s4__aggregate_def temp___568) temp___569)) temp___568)))))

(assert
;; defqtvc
 ;; File "pack.adb", line 59, characters 0-0
  (not
  (forall ((g (Array Int character)) (my_s4 (Array Int character))
  (usf (Array Int character)) (my_s41 (Array Int character)))
  (=> (= my_s4 (pack__a4__my_s4__aggregate_def 32))
  (=>
  (forall ((temp___571 Int))
  (ite (and (<= 1 temp___571) (<= temp___571 4))
  (= (select usf temp___571) (select g temp___571))
  (= (select usf temp___571) (select my_s4 temp___571))))
  (=> (= my_s41 usf)
  (=> (= (to_rep (select my_s41 2)) (to_rep (select g 2)))
  (not (= (to_rep (select my_s41 2)) (to_rep (select g 2)))))))))))
(check-sat)
(exit)
