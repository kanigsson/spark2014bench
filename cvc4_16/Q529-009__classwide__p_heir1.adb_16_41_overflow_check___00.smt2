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

(declare-sort t0 0)

(declare-fun t0qtint (t0) Int)

;; t0'axiom
  (assert
  (forall ((i t0))
  (and (<= (- 2147483648) (t0qtint i)) (<= (t0qtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t0 t0) Bool)

(declare-const dummy1 t0)

(declare-datatypes ((t0__ref 0))
(((t0__refqtmk (t0__content t0)))))
(define-fun t0__ref_t0__content__projection ((a t0__ref)) t0 (t0__content a))

(define-fun to_rep ((x t0)) Int (t0qtint x))

(declare-fun of_rep (Int) t0)

;; inversion_axiom
  (assert
  (forall ((x t0)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x t0)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__p_parent__t_parent__x0 t0)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__p_parent__t_parent__x0__projection ((a us_split_fields)) t0 
  (rec__p_parent__t_parent__x0 a))

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
                           (rec__p_parent__t_parent__x0 (us_split_fields1 a))) 
                   (to_rep
                   (rec__p_parent__t_parent__x0 (us_split_fields1 b)))) true
                   false))

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

(declare-const p_parent__t_parent__x0__first__bit Int)

(declare-const p_parent__t_parent__x0__last__bit Int)

(declare-const p_parent__t_parent__x0__position Int)

;; p_parent__t_parent__x0__first__bit_axiom
  (assert (<= 0 p_parent__t_parent__x0__first__bit))

;; p_parent__t_parent__x0__last__bit_axiom
  (assert
  (< p_parent__t_parent__x0__first__bit p_parent__t_parent__x0__last__bit))

;; p_parent__t_parent__x0__position_axiom
  (assert (<= 0 p_parent__t_parent__x0__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t_parent__ref 0))
(((t_parent__refqtmk (t_parent__content us_rep)))))
(define-fun t_parent__ref_t_parent__content__projection ((a t_parent__ref)) us_rep 
  (t_parent__content a))

(declare-sort t1 0)

(declare-fun t1qtint (t1) Int)

;; t1'axiom
  (assert
  (forall ((i t1))
  (and (<= (- 2147483648) (t1qtint i)) (<= (t1qtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (t1 t1) Bool)

(declare-const dummy3 t1)

(declare-datatypes ((t1__ref 0))
(((t1__refqtmk (t1__content t1)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) t1 (t1__content a))

(define-fun to_rep1 ((x t1)) Int (t1qtint x))

(declare-fun of_rep1 (Int) t1)

;; inversion_axiom
  (assert
  (forall ((x t1)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x t1)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__p_heir1__t_heir1__x1 t1)(rec__p_parent__t_parent__x01 t0)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__p_heir1__t_heir1__x1__projection ((a us_split_fields2)) t1 
  (rec__p_heir1__t_heir1__x1 a))

(define-fun us_split_fields_rec__p_parent__t_parent__x0__2__projection ((a us_split_fields2)) t0 
  (rec__p_parent__t_parent__x01 a))

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

(declare-fun hide_ext__ (t1 us_private) us_private)

(declare-fun extract__p_heir1__t_heir1__x1 (us_private) t1)

;; extract__p_heir1__t_heir1__x1__conv
  (assert
  (forall ((p_heir1__t_heir1__x1 t1))
  (forall ((rec__ext__2 us_private))
  (= (extract__p_heir1__t_heir1__x1
     (hide_ext__ p_heir1__t_heir1__x1 rec__ext__2)) p_heir1__t_heir1__x1))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__p_parent__t_parent__x01
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__p_heir1__t_heir1__x1
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__p_heir1__t_heir1__x1
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__p_parent__t_parent__x0
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep1
                            (rec__p_heir1__t_heir1__x1 (us_split_fields3 a))) 
                         (to_rep1
                         (rec__p_heir1__t_heir1__x1 (us_split_fields3 b))))
                         (= (to_rep
                            (rec__p_parent__t_parent__x01
                            (us_split_fields3 a))) (to_rep
                                                   (rec__p_parent__t_parent__x01
                                                   (us_split_fields3 b)))))
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

(declare-const p_heir1__t_heir1__x1__first__bit Int)

(declare-const p_heir1__t_heir1__x1__last__bit Int)

(declare-const p_heir1__t_heir1__x1__position Int)

;; p_heir1__t_heir1__x1__first__bit_axiom
  (assert (<= 0 p_heir1__t_heir1__x1__first__bit))

;; p_heir1__t_heir1__x1__last__bit_axiom
  (assert
  (< p_heir1__t_heir1__x1__first__bit p_heir1__t_heir1__x1__last__bit))

;; p_heir1__t_heir1__x1__position_axiom
  (assert (<= 0 p_heir1__t_heir1__x1__position))

(declare-const p_parent__t_parent__x0__first__bit1 Int)

(declare-const p_parent__t_parent__x0__last__bit1 Int)

(declare-const p_parent__t_parent__x0__position1 Int)

;; p_parent__t_parent__x0__first__bit_axiom
  (assert (<= 0 p_parent__t_parent__x0__first__bit1))

;; p_parent__t_parent__x0__last__bit_axiom
  (assert
  (< p_parent__t_parent__x0__first__bit1 p_parent__t_parent__x0__last__bit1))

;; p_parent__t_parent__x0__position_axiom
  (assert (<= 0 p_parent__t_parent__x0__position1))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((t_heir1__ref 0))
(((t_heir1__refqtmk (t_heir1__content us_rep1)))))
(define-fun t_heir1__ref_t_heir1__content__projection ((a t_heir1__ref)) us_rep1 
  (t_heir1__content a))

(declare-fun get_x1 (us_rep1) Int)

(declare-fun get_x1__function_guard (Int us_rep1) Bool)

(declare-fun get_x11 (Int us_rep1) Int)

(declare-fun get_x1__function_guard1 (Int Int us_rep1) Bool)

(define-fun default_initial_assumption ((temp___expr_183 us_rep1)
  (temp___skip_top_level_184 Bool)) Bool (= (attr__tag1 temp___expr_183) 
  us_tag1))

(define-fun dynamic_invariant ((temp___expr_175 Int)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (or (= temp___is_init_171 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_175)))

;; get_x1__post_axiom
  (assert
  (forall ((this us_rep1))
  (! (let ((result (get_x1 this)))
     (=> (get_x1__function_guard result this) (dynamic_invariant result true
     false true true))) :pattern ((get_x1 this)) )))

;; get_x1__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((this us_rep1))
  (! (let ((result (get_x11 attr__tag2 this)))
     (=> (get_x1__function_guard1 result attr__tag2 this) (dynamic_invariant
     result true false true true))) :pattern ((get_x11 attr__tag2 this)) ))))

;; p_heir1__t_heir1__compat_axiom
  (assert
  (forall ((this us_rep1))
  (! (=> (get_x1__function_guard1 (get_x11 us_tag1 this) us_tag1 this)
     (and
     (forall ((this1 us_rep1)) (get_x1__function_guard (get_x1 this1) this1))
     (= (get_x1 this) (get_x11 us_tag1 this)))) :pattern ((get_x11 us_tag1
                                                          this)) )))

;; get_x1__def_axiom
  (assert
  (forall ((this us_rep1))
  (! (= (get_x1 this) (to_rep1
                      (rec__p_heir1__t_heir1__x1 (us_split_fields3 this)))) :pattern (
  (get_x1 this)) )))

(declare-fun set_x1__specific_post (Int us_split_fields2 Int Int
  us_split_fields2) Bool)

;; p_heir1__t_heir1__compat_axiom
  (assert true)

(declare-const this__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun get_x0 (us_rep) Int)

(declare-fun get_x0__function_guard (Int us_rep) Bool)

(declare-fun get_x01 (Int us_rep) Int)

(declare-fun get_x0__function_guard1 (Int Int us_rep) Bool)

(define-fun default_initial_assumption1 ((temp___expr_168 us_rep)
  (temp___skip_top_level_169 Bool)) Bool (= (attr__tag temp___expr_168) 
  us_tag))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_160)))

;; get_x0__post_axiom
  (assert
  (forall ((this us_rep))
  (! (let ((result (get_x0 this)))
     (=> (get_x0__function_guard result this) (dynamic_invariant1 result true
     false true true))) :pattern ((get_x0 this)) )))

;; get_x0__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((this us_rep))
  (! (let ((result (get_x01 attr__tag2 this)))
     (=> (get_x0__function_guard1 result attr__tag2 this) (dynamic_invariant1
     result true false true true))) :pattern ((get_x01 attr__tag2 this)) ))))

;; p_heir1__t_heir1__compat_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (get_x0__function_guard1 (get_x01 us_tag1 this) us_tag1 this)
     (and
     (forall ((this1 us_rep)) (get_x0__function_guard (get_x0 this1) this1))
     (= (get_x0 this) (get_x01 us_tag1 this)))) :pattern ((get_x01 us_tag1
                                                          this)) )))

;; p_parent__t_parent__compat_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (get_x0__function_guard1 (get_x01 us_tag this) us_tag this)
     (and
     (forall ((this1 us_rep)) (get_x0__function_guard (get_x0 this1) this1))
     (= (get_x0 this) (get_x01 us_tag this)))) :pattern ((get_x01 us_tag
                                                         this)) )))

(declare-fun set_x0__specific_post (Int us_split_fields Int Int
  us_split_fields) Bool)

;; p_heir1__t_heir1__compat_axiom
  (assert true)

;; p_parent__t_parent__compat_axiom
  (assert true)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "p_heir1.ads", line 15, characters 0-0
  (not
  (forall ((this__split_fields us_split_fields2))
  (let ((o (us_repqtmk1 this__split_fields this__attr__tag)))
  (let ((o1 (get_x1 o)))
  (=>
  (and (get_x1__function_guard o1 o)
  (and (dynamic_invariant o1 true false true true)
  (= o1 (to_rep1 (rec__p_heir1__t_heir1__x1 this__split_fields))))) (in_range
  (+ o1 1))))))))
(check-sat)
(exit)
