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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__dispatch__root__f integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__dispatch__root__f__projection ((a us_split_fields)) integer 
  (rec__dispatch__root__f a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__dispatch__root__f (us_split_fields1 a))) 
                   (to_rep (rec__dispatch__root__f (us_split_fields1 b))))
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

(declare-const dispatch__root__f__first__bit Int)

(declare-const dispatch__root__f__last__bit Int)

(declare-const dispatch__root__f__position Int)

;; dispatch__root__f__first__bit_axiom
  (assert (<= 0 dispatch__root__f__first__bit))

;; dispatch__root__f__last__bit_axiom
  (assert (< dispatch__root__f__first__bit dispatch__root__f__last__bit))

;; dispatch__root__f__position_axiom
  (assert (<= 0 dispatch__root__f__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((root__ref 0))
(((root__refqtmk (root__content us_rep)))))
(define-fun root__ref_root__content__projection ((a root__ref)) us_rep 
  (root__content a))

(declare-const r__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_182 us_rep)
  (temp___skip_top_level_183 Bool)) Bool (= (attr__tag temp___expr_182) 
  us_tag))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__dispatch__nested__child__g integer)(rec__dispatch__root__f1 integer)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__dispatch__nested__child__g__projection ((a us_split_fields2)) integer 
  (rec__dispatch__nested__child__g a))

(define-fun us_split_fields_rec__dispatch__root__f__2__projection ((a us_split_fields2)) integer 
  (rec__dispatch__root__f1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (integer us_private) us_private)

(declare-fun extract__dispatch__nested__child__g (us_private) integer)

;; extract__dispatch__nested__child__g__conv
  (assert
  (forall ((dispatch__nested__child__g integer))
  (forall ((rec__ext__2 us_private))
  (= (extract__dispatch__nested__child__g
     (hide_ext__ dispatch__nested__child__g rec__ext__2)) dispatch__nested__child__g))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__dispatch__root__f1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__dispatch__nested__child__g
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__dispatch__nested__child__g
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__dispatch__root__f
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__dispatch__nested__child__g
                            (us_split_fields3 a))) (to_rep
                                                   (rec__dispatch__nested__child__g
                                                   (us_split_fields3 b))))
                         (= (to_rep
                            (rec__dispatch__root__f1 (us_split_fields3 a))) 
                         (to_rep
                         (rec__dispatch__root__f1 (us_split_fields3 b)))))
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

(declare-const dispatch__nested__child__g__first__bit Int)

(declare-const dispatch__nested__child__g__last__bit Int)

(declare-const dispatch__nested__child__g__position Int)

;; dispatch__nested__child__g__first__bit_axiom
  (assert (<= 0 dispatch__nested__child__g__first__bit))

;; dispatch__nested__child__g__last__bit_axiom
  (assert
  (< dispatch__nested__child__g__first__bit dispatch__nested__child__g__last__bit))

;; dispatch__nested__child__g__position_axiom
  (assert (<= 0 dispatch__nested__child__g__position))

(declare-const dispatch__root__f__first__bit1 Int)

(declare-const dispatch__root__f__last__bit1 Int)

(declare-const dispatch__root__f__position1 Int)

;; dispatch__root__f__first__bit_axiom
  (assert (<= 0 dispatch__root__f__first__bit1))

;; dispatch__root__f__last__bit_axiom
  (assert (< dispatch__root__f__first__bit1 dispatch__root__f__last__bit1))

;; dispatch__root__f__position_axiom
  (assert (<= 0 dispatch__root__f__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((child__ref 0))
(((child__refqtmk (child__content us_rep1)))))
(define-fun child__ref_child__content__projection ((a child__ref)) us_rep1 
  (child__content a))

(declare-const c__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption1 ((temp___expr_190 us_rep1)
  (temp___skip_top_level_191 Bool)) Bool (= (attr__tag1 temp___expr_190) 
  us_tag1))

(declare-const rc__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const cc__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun init (tuple0) us_rep)

(declare-fun init__function_guard (us_rep tuple0) Bool)

(declare-fun init1 (Int tuple0) us_rep)

(declare-fun init__function_guard1 (us_rep Int tuple0) Bool)

(declare-fun init2 (tuple0) us_rep1)

(declare-fun init__function_guard2 (us_rep1 tuple0) Bool)

(declare-fun init3 (Int tuple0) us_rep1)

(declare-fun init__function_guard3 (us_rep1 Int tuple0) Bool)

;; init__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (init us_void_param)))
     (=> (init__function_guard result us_void_param)
     (= (attr__tag result) us_tag))) :pattern ((init us_void_param)) )))

;; init__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((us_void_param tuple0))
  (! (let ((result (init1 attr__tag2 us_void_param)))
     (=> (init__function_guard1 result attr__tag2 us_void_param)
     (= (attr__tag result) attr__tag2))) :pattern ((init1 attr__tag2
                                                   us_void_param)) ))))

;; dispatch__root__compat_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (=> (init__function_guard1 (init1 us_tag us_void_param) us_tag
     us_void_param)
     (and
     (forall ((us_void_param1 tuple0)) (init__function_guard
     (init us_void_param1) us_void_param1))
     (= (init us_void_param) (init1 us_tag us_void_param)))) :pattern (
  (init1 us_tag us_void_param)) )))

;; dispatch__nested__child__compat_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (=> (init__function_guard1 (init1 us_tag1 us_void_param) us_tag1
     us_void_param)
     (and
     (forall ((us_void_param1 tuple0)) (init__function_guard2
     (init2 us_void_param1) us_void_param1))
     (= (to_base (init2 us_void_param)) (init1 us_tag1 us_void_param)))) :pattern (
  (init1 us_tag1 us_void_param)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; init__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (init us_void_param) (us_repqtmk
                             (us_split_fieldsqtmk rliteral us_null_ext__)
                             us_tag)) :pattern ((init us_void_param)) )))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

;; init__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (init2 us_void_param)))
     (=> (init__function_guard2 result us_void_param)
     (= (attr__tag1 result) us_tag1))) :pattern ((init2 us_void_param)) )))

;; init__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((us_void_param tuple0))
  (! (let ((result (init3 attr__tag2 us_void_param)))
     (=> (init__function_guard3 result attr__tag2 us_void_param)
     (= (attr__tag1 result) attr__tag2))) :pattern ((init3 attr__tag2
                                                    us_void_param)) ))))

;; dispatch__nested__child__compat_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (=> (init__function_guard3 (init3 us_tag1 us_void_param) us_tag1
     us_void_param)
     (and
     (forall ((us_void_param1 tuple0)) (init__function_guard2
     (init2 us_void_param1) us_void_param1))
     (= (init2 us_void_param) (init3 us_tag1 us_void_param)))) :pattern (
  (init3 us_tag1 us_void_param)) )))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 1))

;; init__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (init2 us_void_param) (us_repqtmk1
                              (us_split_fieldsqtmk1 rliteral1 rliteral1
                              us_null_ext__) us_tag1)) :pattern ((init2
                                                                 us_void_param)) )))

(assert
;; defqtvc
 ;; File "test_dispatch.adb", line 2, characters 0-0
  (not
  (forall ((r__split_fields us_split_fields)
  (c__split_fields us_split_fields2) (rc__split_fields us_split_fields))
  (=> (default_initial_assumption (us_repqtmk r__split_fields r__attr__tag)
  false)
  (=> (= rc__split_fields r__split_fields)
  (=> (default_initial_assumption1 (us_repqtmk1 c__split_fields c__attr__tag)
  false)
  (=> (= rc__attr__tag r__attr__tag)
  (let ((test_dispatch__cc__assume (to_base
                                   (us_repqtmk1 c__split_fields c__attr__tag))))
  (forall ((cc__split_fields us_split_fields))
  (=> (= cc__split_fields (us_split_fields1 test_dispatch__cc__assume))
  (=> (= cc__attr__tag (attr__tag test_dispatch__cc__assume))
  (let ((o rc__attr__tag))
  (let ((q_ (init1 o Tuple0)))
  (=> (init__function_guard1 q_ o Tuple0)
  (forall ((rc__split_fields1 us_split_fields))
  (=> (= rc__split_fields1 (us_split_fields1 q_))
  (let ((o1 cc__attr__tag))
  (let ((q_1 (init1 o1 Tuple0)))
  (=> (init__function_guard1 q_1 o1 Tuple0)
  (forall ((cc__split_fields1 us_split_fields))
  (=> (= cc__split_fields1 (us_split_fields1 q_1))
  (= (to_rep (rec__dispatch__root__f rc__split_fields1)) (to_rep
                                                         (rec__dispatch__root__f
                                                         cc__split_fields1))))))))))))))))))))))))
(check-sat)
(exit)
