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

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__test_tag__root__f integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__test_tag__root__f__projection ((a us_split_fields)) integer 
  (rec__test_tag__root__f a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__test_tag__root__f (us_split_fields1 a))) 
                   (to_rep (rec__test_tag__root__f (us_split_fields1 b))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_tag__root__f__first__bit Int)

(declare-const test_tag__root__f__last__bit Int)

(declare-const test_tag__root__f__position Int)

;; test_tag__root__f__first__bit_axiom
  (assert (<= 0 test_tag__root__f__first__bit))

;; test_tag__root__f__last__bit_axiom
  (assert (< test_tag__root__f__first__bit test_tag__root__f__last__bit))

;; test_tag__root__f__position_axiom
  (assert (<= 0 test_tag__root__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((root__ref (root__refqtmk (root__content us_rep)))))
(define-fun root__ref_root__content__projection ((a root__ref)) us_rep 
  (root__content a))

(define-fun default_initial_assumption ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (and
                                         (= (attr__tag temp___expr_180) 
                                         us_tag)
                                         (= (to_rep
                                            (rec__test_tag__root__f
                                            (us_split_fields1
                                            temp___expr_180))) 0)))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__test_tag__child__g integer)(rec__test_tag__root__f1 integer)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__test_tag__child__g__projection ((a us_split_fields2)) integer 
  (rec__test_tag__child__g a))

(define-fun us_split_fields_rec__test_tag__root__f__2__projection ((a us_split_fields2)) integer 
  (rec__test_tag__root__f1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (integer us_private) us_private)

(declare-fun extract__test_tag__child__g (us_private) integer)

;; extract__test_tag__child__g__conv
  (assert
  (forall ((test_tag__child__g integer))
  (forall ((rec__ext__2 us_private))
  (= (extract__test_tag__child__g
     (hide_ext__ test_tag__child__g rec__ext__2)) test_tag__child__g))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__test_tag__root__f1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__test_tag__child__g
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__test_tag__child__g
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__test_tag__root__f
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__test_tag__child__g (us_split_fields3 a))) 
                         (to_rep
                         (rec__test_tag__child__g (us_split_fields3 b))))
                         (= (to_rep
                            (rec__test_tag__root__f1 (us_split_fields3 a))) 
                         (to_rep
                         (rec__test_tag__root__f1 (us_split_fields3 b)))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_tag__child__g__first__bit Int)

(declare-const test_tag__child__g__last__bit Int)

(declare-const test_tag__child__g__position Int)

;; test_tag__child__g__first__bit_axiom
  (assert (<= 0 test_tag__child__g__first__bit))

;; test_tag__child__g__last__bit_axiom
  (assert (< test_tag__child__g__first__bit test_tag__child__g__last__bit))

;; test_tag__child__g__position_axiom
  (assert (<= 0 test_tag__child__g__position))

(declare-const test_tag__root__f__first__bit1 Int)

(declare-const test_tag__root__f__last__bit1 Int)

(declare-const test_tag__root__f__position1 Int)

;; test_tag__root__f__first__bit_axiom
  (assert (<= 0 test_tag__root__f__first__bit1))

;; test_tag__root__f__last__bit_axiom
  (assert (< test_tag__root__f__first__bit1 test_tag__root__f__last__bit1))

;; test_tag__root__f__position_axiom
  (assert (<= 0 test_tag__root__f__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((child__ref (child__refqtmk (child__content us_rep1)))))
(define-fun child__ref_child__content__projection ((a child__ref)) us_rep1 
  (child__content a))

(define-fun default_initial_assumption1 ((temp___expr_187 us_rep1)
  (temp___skip_top_level_188 Bool)) Bool (and
                                         (= (attr__tag1 temp___expr_187) 
                                         us_tag1)
                                         (and
                                         (= (to_rep
                                            (rec__test_tag__child__g
                                            (us_split_fields3
                                            temp___expr_187))) 0)
                                         (= (to_rep
                                            (rec__test_tag__root__f1
                                            (us_split_fields3
                                            temp___expr_187))) 0))))

(declare-const r__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const c__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-datatypes ()
((us_rep2
 (us_repqtmk2
 (rec__test_tag__r_acc__is_null_pointer Bool)(rec__test_tag__r_acc__pointer_address Int)(rec__test_tag__r_acc__pointer_value us_rep)))))
(define-fun us_rep_rec__test_tag__r_acc__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__test_tag__r_acc__is_null_pointer a))

(define-fun us_rep_rec__test_tag__r_acc__pointer_address__projection ((a us_rep2)) Int 
  (rec__test_tag__r_acc__pointer_address a))

(define-fun us_rep_rec__test_tag__r_acc__pointer_value__projection ((a us_rep2)) us_rep 
  (rec__test_tag__r_acc__pointer_value a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep2)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep2 
  (us_rep__content a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__test_tag__r_acc__is_null_pointer a) 
                         (rec__test_tag__r_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__test_tag__r_acc__is_null_pointer a) true))
                         (and
                         (= (rec__test_tag__r_acc__pointer_address a) 
                         (rec__test_tag__r_acc__pointer_address b))
                         (= (rec__test_tag__r_acc__pointer_value a) (rec__test_tag__r_acc__pointer_value
                                                                    b)))))
                    true false))

(define-fun rec__test_tag__r_acc__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__test_tag__r_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep2)

;; __null_pointer__def_axiom
  (assert (= (rec__test_tag__r_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy3 us_rep2)

(declare-datatypes ()
((r_acc__ref (r_acc__refqtmk (r_acc__content us_rep2)))))
(define-fun r_acc__ref_r_acc__content__projection ((a r_acc__ref)) us_rep2 
  (r_acc__content a))

(define-fun default_initial_assumption2 ((temp___expr_194 us_rep2)
  (temp___skip_top_level_195 Bool)) Bool (= (rec__test_tag__r_acc__is_null_pointer
                                            temp___expr_194) true))

(declare-datatypes ()
((us_rep3
 (us_repqtmk3
 (rec__test_tag__rc_acc__is_null_pointer Bool)(rec__test_tag__rc_acc__pointer_address Int)(rec__test_tag__rc_acc__pointer_value us_rep)))))
(define-fun us_rep_rec__test_tag__rc_acc__is_null_pointer__projection ((a us_rep3)) Bool 
  (rec__test_tag__rc_acc__is_null_pointer a))

(define-fun us_rep_rec__test_tag__rc_acc__pointer_address__projection ((a us_rep3)) Int 
  (rec__test_tag__rc_acc__pointer_address a))

(define-fun us_rep_rec__test_tag__rc_acc__pointer_value__projection ((a us_rep3)) us_rep 
  (rec__test_tag__rc_acc__pointer_value a))

(declare-datatypes ()
((us_rep__ref1 (us_rep__refqtmk1 (us_rep__content1 us_rep3)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep3 
  (us_rep__content1 a))

(define-fun bool_eq3 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (= (rec__test_tag__rc_acc__is_null_pointer a) 
                         (rec__test_tag__rc_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__test_tag__rc_acc__is_null_pointer a) true))
                         (and
                         (= (rec__test_tag__rc_acc__pointer_address a) 
                         (rec__test_tag__rc_acc__pointer_address b))
                         (= (rec__test_tag__rc_acc__pointer_value a) 
                         (rec__test_tag__rc_acc__pointer_value b)))))
                    true false))

(define-fun rec__test_tag__rc_acc__pointer_value__pred ((a us_rep3)) Bool 
  (not (= (rec__test_tag__rc_acc__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep3)

;; __null_pointer__def_axiom
  (assert (= (rec__test_tag__rc_acc__is_null_pointer us_null_pointer1) true))

(declare-const dummy4 us_rep3)

(declare-datatypes ()
((rc_acc__ref (rc_acc__refqtmk (rc_acc__content us_rep3)))))
(define-fun rc_acc__ref_rc_acc__content__projection ((a rc_acc__ref)) us_rep3 
  (rc_acc__content a))

(define-fun default_initial_assumption3 ((temp___expr_206 us_rep3)
  (temp___skip_top_level_207 Bool)) Bool (= (rec__test_tag__rc_acc__is_null_pointer
                                            temp___expr_206) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const r__split_fields us_split_fields)

(declare-const c__split_fields us_split_fields2)

;; Assume
  (assert (default_initial_assumption
  (us_repqtmk r__split_fields r__attr__tag) false))

;; Assume
  (assert true)

;; Assume
  (assert (default_initial_assumption1
  (us_repqtmk1 c__split_fields c__attr__tag) false))

;; Assume
  (assert true)

(declare-const us_next_pointer_address Int)

(declare-const test_tag__test_init_4__x__assume us_rep3)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__test_tag__rc_acc__is_null_pointer
                  test_tag__test_init_4__x__assume) true))
               (= (rec__test_tag__rc_acc__pointer_address
                  test_tag__test_init_4__x__assume) us_next_pointer_address))
          true false) (ite (= (rec__test_tag__rc_acc__pointer_value
                              test_tag__test_init_4__x__assume) (us_repqtmk
                                                                r__split_fields
                                                                r__attr__tag))
                      true false)) true))

(declare-const x__pointer_value us_rep)

;; H
  (assert
  (= x__pointer_value (rec__test_tag__rc_acc__pointer_value
                      test_tag__test_init_4__x__assume)))

(declare-const x__pointer_address Int)

;; H
  (assert
  (= x__pointer_address (rec__test_tag__rc_acc__pointer_address
                        test_tag__test_init_4__x__assume)))

(declare-const x__is_null_pointer Bool)

;; H
  (assert
  (= x__is_null_pointer (rec__test_tag__rc_acc__is_null_pointer
                        test_tag__test_init_4__x__assume)))

;; Assume
  (assert true)

(declare-const us_next_pointer_address1 Int)

(declare-const test_tag__test_init_4__y__assume us_rep3)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__test_tag__rc_acc__is_null_pointer
                  test_tag__test_init_4__y__assume) true))
               (= (rec__test_tag__rc_acc__pointer_address
                  test_tag__test_init_4__y__assume) us_next_pointer_address1))
          true false) (ite (= (rec__test_tag__rc_acc__pointer_value
                              test_tag__test_init_4__y__assume) (to_base
                                                                (us_repqtmk1
                                                                c__split_fields
                                                                c__attr__tag)))
                      true false)) true))

(declare-const y__pointer_value us_rep)

;; H
  (assert
  (= y__pointer_value (rec__test_tag__rc_acc__pointer_value
                      test_tag__test_init_4__y__assume)))

(declare-const y__pointer_address Int)

;; H
  (assert
  (= y__pointer_address (rec__test_tag__rc_acc__pointer_address
                        test_tag__test_init_4__y__assume)))

(declare-const y__is_null_pointer Bool)

;; H
  (assert
  (= y__is_null_pointer (rec__test_tag__rc_acc__is_null_pointer
                        test_tag__test_init_4__y__assume)))

;; Assume
  (assert true)

(declare-const us_next_pointer_address2 Int)

(declare-const test_tag__test_init_4__z__assume us_rep2)

;; H
  (assert
  (= (and (ite (and
               (not
               (= (rec__test_tag__r_acc__is_null_pointer
                  test_tag__test_init_4__z__assume) true))
               (= (rec__test_tag__r_acc__pointer_address
                  test_tag__test_init_4__z__assume) us_next_pointer_address2))
          true false) (ite (= (rec__test_tag__r_acc__pointer_value
                              test_tag__test_init_4__z__assume) (us_repqtmk
                                                                (us_split_fields1
                                                                (to_base
                                                                (us_repqtmk1
                                                                c__split_fields
                                                                c__attr__tag)))
                                                                us_tag))
                      true false)) true))

(declare-const z__pointer_value us_rep)

;; H
  (assert
  (= z__pointer_value (rec__test_tag__r_acc__pointer_value
                      test_tag__test_init_4__z__assume)))

(declare-const z__pointer_address Int)

;; H
  (assert
  (= z__pointer_address (rec__test_tag__r_acc__pointer_address
                        test_tag__test_init_4__z__assume)))

(declare-const z__is_null_pointer Bool)

;; H
  (assert
  (= z__is_null_pointer (rec__test_tag__r_acc__is_null_pointer
                        test_tag__test_init_4__z__assume)))

;; Assume
  (assert true)

;; Assert
  (assert (= (attr__tag x__pointer_value) us_tag))

(assert
;; defqtvc
 ;; File "test_tag.adb", line 62, characters 0-0
  (not (rec__test_tag__rc_acc__pointer_value__pred
  (us_repqtmk3 y__is_null_pointer y__pointer_address y__pointer_value))))
(check-sat)
