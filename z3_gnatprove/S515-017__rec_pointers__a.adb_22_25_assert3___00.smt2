(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (rec__a__list_ptr__is_null_pointer Bool)(rec__a__list_ptr__pointer_address Int)(rec__a__list_ptr__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__a__list_ptr__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__a__list_ptr__is_null_pointer a))

(define-fun us_rep_rec__a__list_ptr__pointer_address__projection ((a us_rep)) Int 
  (rec__a__list_ptr__pointer_address a))

(define-fun us_rep_rec__a__list_ptr__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__a__list_ptr__pointer_value_abstr a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__a__list_ptr__is_null_pointer a) (rec__a__list_ptr__is_null_pointer
                                                                 b))
                        (=>
                        (not (= (rec__a__list_ptr__is_null_pointer a) true))
                        (and
                        (= (rec__a__list_ptr__pointer_address a) (rec__a__list_ptr__pointer_address
                                                                 b))
                        (= (rec__a__list_ptr__pointer_value_abstr a) 
                        (rec__a__list_ptr__pointer_value_abstr b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ()
((list_ptr__ref (list_ptr__refqtmk (list_ptr__content us_rep)))))
(define-fun list_ptr__ref_list_ptr__content__projection ((a list_ptr__ref)) us_rep 
  (list_ptr__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__a__list__val integer)(rec__a__list__next us_rep)))))
(define-fun us_split_fields_rec__a__list__val__projection ((a us_split_fields)) integer 
  (rec__a__list__val a))

(define-fun us_split_fields_rec__a__list__next__projection ((a us_split_fields)) us_rep 
  (rec__a__list__next a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep (rec__a__list__val (us_split_fields1 a))) 
                         (to_rep (rec__a__list__val (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__a__list__next (us_split_fields1 a))
                            (rec__a__list__next (us_split_fields1 b))) true))
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

(declare-const a__list__val__first__bit Int)

(declare-const a__list__val__last__bit Int)

(declare-const a__list__val__position Int)

;; a__list__val__first__bit_axiom
  (assert (<= 0 a__list__val__first__bit))

;; a__list__val__last__bit_axiom
  (assert (< a__list__val__first__bit a__list__val__last__bit))

;; a__list__val__position_axiom
  (assert (<= 0 a__list__val__position))

(declare-const a__list__next__first__bit Int)

(declare-const a__list__next__last__bit Int)

(declare-const a__list__next__position Int)

;; a__list__next__first__bit_axiom
  (assert (<= 0 a__list__next__first__bit))

;; a__list__next__last__bit_axiom
  (assert (< a__list__next__first__bit a__list__next__last__bit))

;; a__list__next__position_axiom
  (assert (<= 0 a__list__next__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes () ((list__ref (list__refqtmk (list__content us_rep1)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep1 
  (list__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun default_initial_assumption ((temp___expr_187 us_rep1)
  (temp___skip_top_level_188 Bool)) Bool (= (rec__a__list_ptr__is_null_pointer
                                            (rec__a__list__next
                                            (us_split_fields1
                                            temp___expr_187))) true))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun default_initial_assumption1 ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (= (rec__a__list_ptr__is_null_pointer
                                            temp___expr_180) true))

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__a__list_ptr__pointer_value ((a us_rep)) us_rep1 (us_open
                                                                 (rec__a__list_ptr__pointer_value_abstr
                                                                 a)))

(define-fun rec__a__list_ptr__pointer_value__pred ((a us_rep)) Bool (not
                                                                    (= 
                                                                    (rec__a__list_ptr__is_null_pointer
                                                                    a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__a__list_ptr__is_null_pointer us_null_pointer) true))

(declare-const dummy3 us_rep)

(declare-datatypes () ((t3b__ref (t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-const dummy4 us_rep)

(declare-datatypes () ((t4b__ref (t4b__refqtmk (t4b__content us_rep)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_rep (t4b__content
                                                                    a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 3))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

(declare-const rliteral2 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral2) 1))

(declare-const us_next_pointer_address Int)

(declare-const a__lnn__assume us_rep)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__a__list_ptr__is_null_pointer a__lnn__assume) true))
               (= (rec__a__list_ptr__pointer_address a__lnn__assume) 
               us_next_pointer_address))
          true false) (ite (= (rec__a__list_ptr__pointer_value
                              a__lnn__assume) (us_repqtmk1
                                              (us_split_fieldsqtmk rliteral
                                              us_null_pointer)))
                      true false)) true))

(declare-const lnn__pointer_value us_split_fields)

;; H
  (assert
  (= (us_repqtmk1 lnn__pointer_value) (rec__a__list_ptr__pointer_value
                                      a__lnn__assume)))

(declare-const lnn__pointer_address Int)

;; H
  (assert
  (= lnn__pointer_address (rec__a__list_ptr__pointer_address a__lnn__assume)))

(declare-const lnn__is_null_pointer Bool)

;; H
  (assert
  (= lnn__is_null_pointer (rec__a__list_ptr__is_null_pointer a__lnn__assume)))

;; Assume
  (assert true)

(declare-const us_next_pointer_address1 Int)

(declare-const a__ln__assume us_rep)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__a__list_ptr__is_null_pointer a__ln__assume) true))
               (= (rec__a__list_ptr__pointer_address a__ln__assume) us_next_pointer_address1))
          true false) (ite (= (rec__a__list_ptr__pointer_value a__ln__assume) 
                      (us_repqtmk1
                      (us_split_fieldsqtmk rliteral1
                      (us_repqtmk lnn__is_null_pointer lnn__pointer_address
                      (us_close (us_repqtmk1 lnn__pointer_value)))))) true
                      false)) true))

(declare-const ln__pointer_value us_split_fields)

;; H
  (assert
  (= (us_repqtmk1 ln__pointer_value) (rec__a__list_ptr__pointer_value
                                     a__ln__assume)))

(declare-const ln__pointer_address Int)

;; H
  (assert
  (= ln__pointer_address (rec__a__list_ptr__pointer_address a__ln__assume)))

(declare-const ln__is_null_pointer Bool)

;; H
  (assert
  (= ln__is_null_pointer (rec__a__list_ptr__is_null_pointer a__ln__assume)))

;; Assume
  (assert true)

(declare-const l__split_fields us_split_fields)

;; H
  (assert
  (= l__split_fields (us_split_fieldsqtmk rliteral2
                     (us_repqtmk ln__is_null_pointer ln__pointer_address
                     (us_close (us_repqtmk1 ln__pointer_value))))))

;; Assume
  (assert true)

(define-fun a__B_1__n__assume () us_rep (rec__a__list__next l__split_fields))

(declare-const n__pointer_value us_split_fields)

;; H
  (assert
  (= (us_repqtmk1 n__pointer_value) (rec__a__list_ptr__pointer_value
                                    a__B_1__n__assume)))

(declare-const n__pointer_address Int)

;; H
  (assert
  (= n__pointer_address (rec__a__list_ptr__pointer_address a__B_1__n__assume)))

(declare-const n__is_null_pointer Bool)

;; H
  (assert
  (= n__is_null_pointer (rec__a__list_ptr__is_null_pointer a__B_1__n__assume)))

(define-fun o () us_rep (us_repqtmk n__is_null_pointer n__pointer_address
                        (us_close (us_repqtmk1 n__pointer_value))))

(define-fun a__B_1__B_2__m__assume () us_rep (rec__a__list__next
                                             (us_split_fields1
                                             (rec__a__list_ptr__pointer_value
                                             o))))

(declare-const m__pointer_value us_split_fields)

;; H
  (assert
  (= (us_repqtmk1 m__pointer_value) (rec__a__list_ptr__pointer_value
                                    a__B_1__B_2__m__assume)))

(declare-const m__pointer_address Int)

;; H
  (assert
  (= m__pointer_address (rec__a__list_ptr__pointer_address
                        a__B_1__B_2__m__assume)))

(declare-const m__is_null_pointer Bool)

;; H
  (assert
  (= m__is_null_pointer (rec__a__list_ptr__is_null_pointer
                        a__B_1__B_2__m__assume)))

;; Assert
  (assert
  (= (to_rep
     (rec__a__list__val
     (us_split_fields1
     (rec__a__list_ptr__pointer_value
     (us_repqtmk m__is_null_pointer m__pointer_address
     (us_close (us_repqtmk1 m__pointer_value))))))) 3))

;; Assert
  (assert
  (= (to_rep
     (rec__a__list__val
     (us_split_fields1
     (rec__a__list_ptr__pointer_value
     (us_repqtmk n__is_null_pointer n__pointer_address
     (us_close (us_repqtmk1 n__pointer_value))))))) 2))

(assert
;; defqtvc
 ;; File "a.adb", line 1, characters 0-0
  (not (= (to_rep (rec__a__list__val l__split_fields)) 1)))
(check-sat)

(exit)
