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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort my_nat 0)

(declare-fun my_natqtint (my_nat) Int)

;; my_nat'axiom
  (assert
  (forall ((i my_nat))
  (and (<= 0 (my_natqtint i)) (<= (my_natqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (my_nat my_nat) Bool)

(declare-const dummy my_nat)

(declare-datatypes ()
((my_nat__ref (my_nat__refqtmk (my_nat__content my_nat)))))
(define-fun my_nat__ref_my_nat__content__projection ((a my_nat__ref)) my_nat 
  (my_nat__content a))

(declare-datatypes ()
((my_nat__init_wrapper
 (my_nat__init_wrapperqtmk (rec__value my_nat)(attr__init Bool)))))
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

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__nested_init_by_proof__rec__d Bool)))))
(define-fun us_split_discrs_rec__nested_init_by_proof__rec__d__projection ((a us_split_discrs)) Bool 
  (rec__nested_init_by_proof__rec__d a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__nested_init_by_proof__rec__f2 my_nat__init_wrapper)(rec__nested_init_by_proof__rec__f1 my_nat__init_wrapper)(rec__nested_init_by_proof__rec__f3 my_nat__init_wrapper)))))
(define-fun us_split_fields_rec__nested_init_by_proof__rec__f2__projection ((a us_split_fields)) my_nat__init_wrapper 
  (rec__nested_init_by_proof__rec__f2 a))

(define-fun us_split_fields_rec__nested_init_by_proof__rec__f1__projection ((a us_split_fields)) my_nat__init_wrapper 
  (rec__nested_init_by_proof__rec__f1 a))

(define-fun us_split_fields_rec__nested_init_by_proof__rec__f3__projection ((a us_split_fields)) my_nat__init_wrapper 
  (rec__nested_init_by_proof__rec__f3 a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun nested_init_by_proof__rec__f1__pred ((a us_rep)) Bool (= (ite 
  (rec__nested_init_by_proof__rec__d (us_split_discrs1 a)) 1 0) 1))

(define-fun nested_init_by_proof__rec__f3__pred ((a us_rep)) Bool (= (ite 
  (rec__nested_init_by_proof__rec__d (us_split_discrs1 a)) 1 0) 0))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__nested_init_by_proof__rec__d
                                (us_split_discrs1 a)) 1 0) (ite (rec__nested_init_by_proof__rec__d
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (and
                        (and
                        (= (to_rep
                           (rec__value
                           (rec__nested_init_by_proof__rec__f2
                           (us_split_fields1 a)))) (to_rep
                                                   (rec__value
                                                   (rec__nested_init_by_proof__rec__f2
                                                   (us_split_fields1 b)))))
                        (=> (nested_init_by_proof__rec__f1__pred a)
                        (= (to_rep
                           (rec__value
                           (rec__nested_init_by_proof__rec__f1
                           (us_split_fields1 a)))) (to_rep
                                                   (rec__value
                                                   (rec__nested_init_by_proof__rec__f1
                                                   (us_split_fields1 b)))))))
                        (=> (nested_init_by_proof__rec__f3__pred a)
                        (= (to_rep
                           (rec__value
                           (rec__nested_init_by_proof__rec__f3
                           (us_split_fields1 a)))) (to_rep
                                                   (rec__value
                                                   (rec__nested_init_by_proof__rec__f3
                                                   (us_split_fields1 b))))))))
                   true false))

(define-fun in_range2 ((rec__nested_init_by_proof__rec__d1 Bool)
  (a us_split_discrs)) Bool (= rec__nested_init_by_proof__rec__d1 (rec__nested_init_by_proof__rec__d
                                                                  a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const nested_init_by_proof__rec__d__first__bit Int)

(declare-const nested_init_by_proof__rec__d__last__bit Int)

(declare-const nested_init_by_proof__rec__d__position Int)

;; nested_init_by_proof__rec__d__first__bit_axiom
  (assert (<= 0 nested_init_by_proof__rec__d__first__bit))

;; nested_init_by_proof__rec__d__last__bit_axiom
  (assert
  (< nested_init_by_proof__rec__d__first__bit nested_init_by_proof__rec__d__last__bit))

;; nested_init_by_proof__rec__d__position_axiom
  (assert (<= 0 nested_init_by_proof__rec__d__position))

(declare-const nested_init_by_proof__rec__f2__first__bit Int)

(declare-const nested_init_by_proof__rec__f2__last__bit Int)

(declare-const nested_init_by_proof__rec__f2__position Int)

;; nested_init_by_proof__rec__f2__first__bit_axiom
  (assert (<= 0 nested_init_by_proof__rec__f2__first__bit))

;; nested_init_by_proof__rec__f2__last__bit_axiom
  (assert
  (< nested_init_by_proof__rec__f2__first__bit nested_init_by_proof__rec__f2__last__bit))

;; nested_init_by_proof__rec__f2__position_axiom
  (assert (<= 0 nested_init_by_proof__rec__f2__position))

(declare-const nested_init_by_proof__rec__f1__first__bit Int)

(declare-const nested_init_by_proof__rec__f1__last__bit Int)

(declare-const nested_init_by_proof__rec__f1__position Int)

;; nested_init_by_proof__rec__f1__first__bit_axiom
  (assert (<= 0 nested_init_by_proof__rec__f1__first__bit))

;; nested_init_by_proof__rec__f1__last__bit_axiom
  (assert
  (< nested_init_by_proof__rec__f1__first__bit nested_init_by_proof__rec__f1__last__bit))

;; nested_init_by_proof__rec__f1__position_axiom
  (assert (<= 0 nested_init_by_proof__rec__f1__position))

(declare-const nested_init_by_proof__rec__f3__first__bit Int)

(declare-const nested_init_by_proof__rec__f3__last__bit Int)

(declare-const nested_init_by_proof__rec__f3__position Int)

;; nested_init_by_proof__rec__f3__first__bit_axiom
  (assert (<= 0 nested_init_by_proof__rec__f3__first__bit))

;; nested_init_by_proof__rec__f3__last__bit_axiom
  (assert
  (< nested_init_by_proof__rec__f3__first__bit nested_init_by_proof__rec__f3__last__bit))

;; nested_init_by_proof__rec__f3__position_axiom
  (assert (<= 0 nested_init_by_proof__rec__f3__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((rec____ref (rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(declare-const x us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_198 us_rep)
  (temp___skip_top_level_199 Bool)) Bool (and
                                         (= (rec__nested_init_by_proof__rec__d
                                            (us_split_discrs1
                                            temp___expr_198)) (distinct 0 0))
                                         (and
                                         (and
                                         (= (attr__init
                                            (rec__nested_init_by_proof__rec__f2
                                            (us_split_fields1
                                            temp___expr_198))) false)
                                         (=>
                                         (nested_init_by_proof__rec__f1__pred
                                         temp___expr_198)
                                         (and
                                         (= (to_rep
                                            (rec__value
                                            (rec__nested_init_by_proof__rec__f1
                                            (us_split_fields1
                                            temp___expr_198)))) 15)
                                         (= (attr__init
                                            (rec__nested_init_by_proof__rec__f1
                                            (us_split_fields1
                                            temp___expr_198))) true))))
                                         (=>
                                         (nested_init_by_proof__rec__f3__pred
                                         temp___expr_198)
                                         (= (attr__init
                                            (rec__nested_init_by_proof__rec__f3
                                            (us_split_fields1
                                            temp___expr_198))) false)))))

(define-fun dynamic_invariant ((temp___expr_183 Int)
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool)
  (temp___do_typ_inv_182 Bool)) Bool (=>
                                     (or (= temp___is_init_179 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_183)))

;; Assume
  (assert true)

;; Assume
  (assert true)

(declare-const o Bool)

(declare-const o1 Int)

(declare-const o2 Int)

;; H
  (assert
  (ite (and
       (= (ite (rec__nested_init_by_proof__rec__d (us_split_discrs1 x)) 1 0) (ite 
       (rec__nested_init_by_proof__rec__d (us_split_discrs1 y)) 1 0))
       (= (ite (attr__init
               (rec__nested_init_by_proof__rec__f2 (us_split_fields1 x))) 1 0) (ite 
       (attr__init (rec__nested_init_by_proof__rec__f2 (us_split_fields1 y))) 1 0)))
  (ite (= (attr__init
          (rec__nested_init_by_proof__rec__f2 (us_split_fields1 x))) true)
  (and
  (= (to_rep
     (rec__value (rec__nested_init_by_proof__rec__f2 (us_split_fields1 y)))) 
  o1)
  (and
  (= (to_rep
     (rec__value (rec__nested_init_by_proof__rec__f2 (us_split_fields1 x)))) 
  o2) (= o (ite (= o2 o1) true false)))) (= o (distinct 1 0))) (= o false)))

;; H
  (assert (= o true))

;; H
  (assert
  (not (= (rec__nested_init_by_proof__rec__d (us_split_discrs1 x)) true)))

(define-fun o3 () us_rep y)

(define-fun o4 () us_rep x)

;; H
  (assert
  (= (ite (attr__init
          (rec__nested_init_by_proof__rec__f3 (us_split_fields1 o4))) 1 0) (ite 
  (attr__init (rec__nested_init_by_proof__rec__f3 (us_split_fields1 o3))) 1 0)))

(define-fun o5 () us_rep x)

;; H
  (assert
  (= (attr__init (rec__nested_init_by_proof__rec__f3 (us_split_fields1 o5))) true))

(define-fun o6 () us_rep y)

(define-fun o7 () my_nat__init_wrapper (rec__nested_init_by_proof__rec__f3
                                       (us_split_fields1 o6)))

(declare-const o8 Int)

;; Ensures
  (assert (= (to_rep (rec__value o7)) o8))

(define-fun o9 () us_rep x)

(assert
;; defqtvc
 ;; File "nested_init_by_proof.adb", line 19, characters 0-0
  (not
  (= (attr__init (rec__nested_init_by_proof__rec__f3 (us_split_fields1 o9))) true)))
(check-sat)

(exit)
