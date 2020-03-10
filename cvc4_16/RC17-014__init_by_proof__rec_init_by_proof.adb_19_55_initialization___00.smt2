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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort my_nat 0)

(declare-fun my_natqtint (my_nat) Int)

;; my_nat'axiom
  (assert
  (forall ((i my_nat))
  (and (<= 10 (my_natqtint i)) (<= (my_natqtint i) 150))))

(define-fun in_range1 ((x Int)) Bool (and (<= 10 x) (<= x 150)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (my_nat my_nat) Bool)

(declare-const dummy my_nat)

(declare-datatypes ((my_nat__ref 0))
(((my_nat__refqtmk (my_nat__content my_nat)))))
(define-fun my_nat__ref_my_nat__content__projection ((a my_nat__ref)) my_nat 
  (my_nat__content a))

(declare-datatypes ((my_nat__init_wrapper 0))
(((my_nat__init_wrapperqtmk (rec__value my_nat)(attr__init Bool)))))
(define-fun my_nat__init_wrapper_rec__value__projection ((a my_nat__init_wrapper)) my_nat 
  (rec__value a))

(define-fun my_nat__init_wrapper_attr__init__projection ((a my_nat__init_wrapper)) Bool 
  (attr__init a))

(define-fun to_rep ((x my_nat)) Int (my_natqtint x))

(declare-fun of_rep (Int) my_nat)

;; inversion_axiom
  (assert
  (forall ((x my_nat)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x my_nat)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__rec_init_by_proof__three_fields__f1 my_nat__init_wrapper)(rec__rec_init_by_proof__three_fields__f2 my_nat__init_wrapper)(rec__rec_init_by_proof__three_fields__f3 my_nat__init_wrapper)))))
(define-fun us_split_fields_rec__rec_init_by_proof__three_fields__f1__projection ((a us_split_fields)) my_nat__init_wrapper 
  (rec__rec_init_by_proof__three_fields__f1 a))

(define-fun us_split_fields_rec__rec_init_by_proof__three_fields__f2__projection ((a us_split_fields)) my_nat__init_wrapper 
  (rec__rec_init_by_proof__three_fields__f2 a))

(define-fun us_split_fields_rec__rec_init_by_proof__three_fields__f3__projection ((a us_split_fields)) my_nat__init_wrapper 
  (rec__rec_init_by_proof__three_fields__f3 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__value
                           (rec__rec_init_by_proof__three_fields__f1
                           (us_split_fields1 a)))) (to_rep
                                                   (rec__value
                                                   (rec__rec_init_by_proof__three_fields__f1
                                                   (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__value
                           (rec__rec_init_by_proof__three_fields__f2
                           (us_split_fields1 a)))) (to_rep
                                                   (rec__value
                                                   (rec__rec_init_by_proof__three_fields__f2
                                                   (us_split_fields1 b))))))
                        (= (to_rep
                           (rec__value
                           (rec__rec_init_by_proof__three_fields__f3
                           (us_split_fields1 a)))) (to_rep
                                                   (rec__value
                                                   (rec__rec_init_by_proof__three_fields__f3
                                                   (us_split_fields1 b))))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const rec_init_by_proof__three_fields__f1__first__bit Int)

(declare-const rec_init_by_proof__three_fields__f1__last__bit Int)

(declare-const rec_init_by_proof__three_fields__f1__position Int)

;; rec_init_by_proof__three_fields__f1__first__bit_axiom
  (assert (<= 0 rec_init_by_proof__three_fields__f1__first__bit))

;; rec_init_by_proof__three_fields__f1__last__bit_axiom
  (assert
  (< rec_init_by_proof__three_fields__f1__first__bit rec_init_by_proof__three_fields__f1__last__bit))

;; rec_init_by_proof__three_fields__f1__position_axiom
  (assert (<= 0 rec_init_by_proof__three_fields__f1__position))

(declare-const rec_init_by_proof__three_fields__f2__first__bit Int)

(declare-const rec_init_by_proof__three_fields__f2__last__bit Int)

(declare-const rec_init_by_proof__three_fields__f2__position Int)

;; rec_init_by_proof__three_fields__f2__first__bit_axiom
  (assert (<= 0 rec_init_by_proof__three_fields__f2__first__bit))

;; rec_init_by_proof__three_fields__f2__last__bit_axiom
  (assert
  (< rec_init_by_proof__three_fields__f2__first__bit rec_init_by_proof__three_fields__f2__last__bit))

;; rec_init_by_proof__three_fields__f2__position_axiom
  (assert (<= 0 rec_init_by_proof__three_fields__f2__position))

(declare-const rec_init_by_proof__three_fields__f3__first__bit Int)

(declare-const rec_init_by_proof__three_fields__f3__last__bit Int)

(declare-const rec_init_by_proof__three_fields__f3__position Int)

;; rec_init_by_proof__three_fields__f3__first__bit_axiom
  (assert (<= 0 rec_init_by_proof__three_fields__f3__first__bit))

;; rec_init_by_proof__three_fields__f3__last__bit_axiom
  (assert
  (< rec_init_by_proof__three_fields__f3__first__bit rec_init_by_proof__three_fields__f3__last__bit))

;; rec_init_by_proof__three_fields__f3__position_axiom
  (assert (<= 0 rec_init_by_proof__three_fields__f3__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((three_fields__ref 0))
(((three_fields__refqtmk (three_fields__content us_rep)))))
(define-fun three_fields__ref_three_fields__content__projection ((a three_fields__ref)) us_rep 
  (three_fields__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_196 us_rep)
  (temp___skip_top_level_197 Bool)) Bool (and
                                         (and
                                         (= (attr__init
                                            (rec__rec_init_by_proof__three_fields__f1
                                            (us_split_fields1
                                            temp___expr_196))) false)
                                         (= (attr__init
                                            (rec__rec_init_by_proof__three_fields__f2
                                            (us_split_fields1
                                            temp___expr_196))) false))
                                         (and
                                         (= (to_rep
                                            (rec__value
                                            (rec__rec_init_by_proof__three_fields__f3
                                            (us_split_fields1
                                            temp___expr_196)))) 12)
                                         (= (attr__init
                                            (rec__rec_init_by_proof__three_fields__f3
                                            (us_split_fields1
                                            temp___expr_196))) true))))

(define-fun dynamic_invariant ((temp___expr_188 Int)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (or (= temp___is_init_184 true)
                                     (<= 10 150)) (in_range1
                                     temp___expr_188)))

(declare-const rliteral my_nat)

;; rliteral_axiom
  (assert (= (my_natqtint rliteral) 20))

(assert
;; defqtvc
 ;; File "rec_init_by_proof.adb", line 14, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields))
  (forall ((x__split_fields1 us_split_fields))
  (=>
  (= x__split_fields1 (us_split_fieldsqtmk
                      (my_nat__init_wrapperqtmk rliteral true)
                      (rec__rec_init_by_proof__three_fields__f2
                      x__split_fields)
                      (rec__rec_init_by_proof__three_fields__f3
                      x__split_fields)))
  (forall ((o Bool))
  (=>
  (ite (and
       (and
       (= (attr__init
          (rec__rec_init_by_proof__three_fields__f1 x__split_fields1)) true)
       (= (ite (attr__init
               (rec__rec_init_by_proof__three_fields__f2 x__split_fields1)) 1 0) (ite 
       (ite (= (attr__init
               (rec__rec_init_by_proof__three_fields__f2 x__split_fields)) true)
       true false) 1 0)))
       (= (ite (attr__init
               (rec__rec_init_by_proof__three_fields__f3 x__split_fields1)) 1 0) (ite 
       (ite (= (attr__init
               (rec__rec_init_by_proof__three_fields__f3 x__split_fields)) true)
       true false) 1 0)))
  (exists ((o1 Int))
  (and
  (= (to_rep
     (rec__value (rec__rec_init_by_proof__three_fields__f1 x__split_fields1))) o1)
  (= o (ite (= o1 20) true false)))) (= o false))
  (=> (= o true)
  (=>
  (= (attr__init (rec__rec_init_by_proof__three_fields__f2 x__split_fields1)) true)
  (= (attr__init (rec__rec_init_by_proof__three_fields__f2 x__split_fields)) true))))))))))
(check-sat)
(exit)
