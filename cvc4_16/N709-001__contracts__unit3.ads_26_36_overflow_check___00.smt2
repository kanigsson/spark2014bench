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
(((us_split_fieldsqtmk (rec__unit1__t1__c1 integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__unit1__t1__c1__projection ((a us_split_fields)) integer 
  (rec__unit1__t1__c1 a))

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
  (b us_rep)) Bool (ite (= (to_rep (rec__unit1__t1__c1 (us_split_fields1 a))) 
                   (to_rep (rec__unit1__t1__c1 (us_split_fields1 b)))) true
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

(declare-const unit1__t1__c1__first__bit Int)

(declare-const unit1__t1__c1__last__bit Int)

(declare-const unit1__t1__c1__position Int)

;; unit1__t1__c1__first__bit_axiom
  (assert (<= 0 unit1__t1__c1__first__bit))

;; unit1__t1__c1__last__bit_axiom
  (assert (< unit1__t1__c1__first__bit unit1__t1__c1__last__bit))

;; unit1__t1__c1__position_axiom
  (assert (<= 0 unit1__t1__c1__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((t1__ref 0))
(((t1__refqtmk (t1__content us_rep)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) us_rep (t1__content
                                                                 a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__unit2__t2__c2 integer)(rec__unit1__t1__c11 integer)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__unit2__t2__c2__projection ((a us_split_fields2)) integer 
  (rec__unit2__t2__c2 a))

(define-fun us_split_fields_rec__unit1__t1__c1__2__projection ((a us_split_fields2)) integer 
  (rec__unit1__t1__c11 a))

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

(declare-fun extract__unit2__t2__c2 (us_private) integer)

;; extract__unit2__t2__c2__conv
  (assert
  (forall ((unit2__t2__c2 integer))
  (forall ((rec__ext__2 us_private))
  (= (extract__unit2__t2__c2 (hide_ext__ unit2__t2__c2 rec__ext__2)) unit2__t2__c2))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__unit1__t1__c11
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__unit2__t2__c2
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__unit2__t2__c2
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__unit1__t1__c1
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__unit2__t2__c2 (us_split_fields3 a))) 
                         (to_rep (rec__unit2__t2__c2 (us_split_fields3 b))))
                         (= (to_rep
                            (rec__unit1__t1__c11 (us_split_fields3 a))) 
                         (to_rep (rec__unit1__t1__c11 (us_split_fields3 b)))))
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

(declare-const unit2__t2__c2__first__bit Int)

(declare-const unit2__t2__c2__last__bit Int)

(declare-const unit2__t2__c2__position Int)

;; unit2__t2__c2__first__bit_axiom
  (assert (<= 0 unit2__t2__c2__first__bit))

;; unit2__t2__c2__last__bit_axiom
  (assert (< unit2__t2__c2__first__bit unit2__t2__c2__last__bit))

;; unit2__t2__c2__position_axiom
  (assert (<= 0 unit2__t2__c2__position))

(declare-const unit1__t1__c1__first__bit1 Int)

(declare-const unit1__t1__c1__last__bit1 Int)

(declare-const unit1__t1__c1__position1 Int)

;; unit1__t1__c1__first__bit_axiom
  (assert (<= 0 unit1__t1__c1__first__bit1))

;; unit1__t1__c1__last__bit_axiom
  (assert (< unit1__t1__c1__first__bit1 unit1__t1__c1__last__bit1))

;; unit1__t1__c1__position_axiom
  (assert (<= 0 unit1__t1__c1__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((t2__ref 0))
(((t2__refqtmk (t2__content us_rep1)))))
(define-fun t2__ref_t2__content__projection ((a t2__ref)) us_rep1 (t2__content
                                                                  a))

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2
  (rec__unit3__t3__c3 integer)(rec__unit1__t1__c12 integer)(rec__unit2__t2__c21 integer)(rec__ext__2 us_private)))))
(define-fun us_split_fields_rec__unit3__t3__c3__projection ((a us_split_fields4)) integer 
  (rec__unit3__t3__c3 a))

(define-fun us_split_fields_rec__unit1__t1__c1__3__projection ((a us_split_fields4)) integer 
  (rec__unit1__t1__c12 a))

(define-fun us_split_fields_rec__unit2__t2__c2__2__projection ((a us_split_fields4)) integer 
  (rec__unit2__t2__c21 a))

(define-fun us_split_fields_rec__ext____3__projection ((a us_split_fields4)) us_private 
  (rec__ext__2 a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)(attr__tag2 Int)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun us_rep_attr__tag__3__projection ((a us_rep2)) Int (attr__tag2 a))

(declare-fun hide_ext__1 (integer integer us_private) us_private)

(declare-fun extract__unit3__t3__c3 (us_private) integer)

;; extract__unit3__t3__c3__conv
  (assert
  (forall ((unit3__t3__c3 integer) (unit3__t3__c2 integer))
  (forall ((rec__ext__3 us_private))
  (= (extract__unit3__t3__c3
     (hide_ext__1 unit3__t3__c3 unit3__t3__c2 rec__ext__3)) unit3__t3__c3))))

;; extract__unit2__t2__c2__conv
  (assert
  (forall ((unit3__t3__c3 integer) (unit3__t3__c2 integer))
  (forall ((rec__ext__3 us_private))
  (= (extract__unit2__t2__c2
     (hide_ext__1 unit3__t3__c3 unit3__t3__c2 rec__ext__3)) unit3__t3__c2))))

(declare-fun extract__ext__1 (us_private) us_private)

(define-fun to_base1 ((a us_rep2)) us_rep (us_repqtmk
                                          (us_split_fieldsqtmk
                                          (rec__unit1__t1__c12
                                          (us_split_fields5 a))
                                          (hide_ext__1
                                          (rec__unit3__t3__c3
                                          (us_split_fields5 a))
                                          (rec__unit2__t2__c21
                                          (us_split_fields5 a))
                                          (rec__ext__2 (us_split_fields5 a))))
                                          (attr__tag2 a)))

(define-fun of_base1 ((r us_rep)) us_rep2 (us_repqtmk2
                                          (us_split_fieldsqtmk2
                                          (extract__unit3__t3__c3
                                          (rec__ext__ (us_split_fields1 r)))
                                          (rec__unit1__t1__c1
                                          (us_split_fields1 r))
                                          (extract__unit2__t2__c2
                                          (rec__ext__ (us_split_fields1 r)))
                                          (extract__ext__1
                                          (rec__ext__ (us_split_fields1 r))))
                                          (attr__tag r)))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (and
                         (= (to_rep
                            (rec__unit3__t3__c3 (us_split_fields5 a))) 
                         (to_rep (rec__unit3__t3__c3 (us_split_fields5 b))))
                         (= (to_rep
                            (rec__unit1__t1__c12 (us_split_fields5 a))) 
                         (to_rep (rec__unit1__t1__c12 (us_split_fields5 b)))))
                         (= (to_rep
                            (rec__unit2__t2__c21 (us_split_fields5 a))) 
                         (to_rep (rec__unit2__t2__c21 (us_split_fields5 b)))))
                    true false))

(declare-const us_tag2 Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const unit3__t3__c3__first__bit Int)

(declare-const unit3__t3__c3__last__bit Int)

(declare-const unit3__t3__c3__position Int)

;; unit3__t3__c3__first__bit_axiom
  (assert (<= 0 unit3__t3__c3__first__bit))

;; unit3__t3__c3__last__bit_axiom
  (assert (< unit3__t3__c3__first__bit unit3__t3__c3__last__bit))

;; unit3__t3__c3__position_axiom
  (assert (<= 0 unit3__t3__c3__position))

(declare-const unit1__t1__c1__first__bit2 Int)

(declare-const unit1__t1__c1__last__bit2 Int)

(declare-const unit1__t1__c1__position2 Int)

;; unit1__t1__c1__first__bit_axiom
  (assert (<= 0 unit1__t1__c1__first__bit2))

;; unit1__t1__c1__last__bit_axiom
  (assert (< unit1__t1__c1__first__bit2 unit1__t1__c1__last__bit2))

;; unit1__t1__c1__position_axiom
  (assert (<= 0 unit1__t1__c1__position2))

(declare-const unit2__t2__c2__first__bit1 Int)

(declare-const unit2__t2__c2__last__bit1 Int)

(declare-const unit2__t2__c2__position1 Int)

;; unit2__t2__c2__first__bit_axiom
  (assert (<= 0 unit2__t2__c2__first__bit1))

;; unit2__t2__c2__last__bit_axiom
  (assert (< unit2__t2__c2__first__bit1 unit2__t2__c2__last__bit1))

;; unit2__t2__c2__position_axiom
  (assert (<= 0 unit2__t2__c2__position1))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ((t3__ref 0))
(((t3__refqtmk (t3__content us_rep2)))))
(define-fun t3__ref_t3__content__projection ((a t3__ref)) us_rep2 (t3__content
                                                                  a))

(define-fun default_initial_assumption ((temp___expr_185 us_rep2)
  (temp___skip_top_level_186 Bool)) Bool (= (attr__tag2 temp___expr_185) 
  us_tag2))

(declare-fun is_max (us_rep2) Bool)

(declare-fun is_max__function_guard (Bool us_rep2) Bool)

(declare-fun is_max1 (Int us_rep2) Bool)

(declare-fun is_max__function_guard1 (Bool Int us_rep2) Bool)

(declare-const x__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-fun is_max2 (us_rep1) Bool)

(declare-fun is_max__function_guard2 (Bool us_rep1) Bool)

(declare-fun is_max3 (Int us_rep1) Bool)

(declare-fun is_max__function_guard3 (Bool Int us_rep1) Bool)

(define-fun default_initial_assumption1 ((temp___expr_176 us_rep1)
  (temp___skip_top_level_177 Bool)) Bool (= (attr__tag1 temp___expr_176) 
  us_tag1))

(declare-fun next (us_rep1) us_rep1)

(declare-fun next__function_guard (us_rep1 us_rep1) Bool)

(declare-fun next1 (Int us_rep1) us_rep1)

(declare-fun next__function_guard1 (us_rep1 Int us_rep1) Bool)

(declare-fun bump__specific_post (Int us_split_fields2 Int
  us_split_fields2) Bool)

;; unit3__t3__compat_axiom
  (assert
  (forall ((unit2__bump__x__fields us_split_fields2)
  (unit2__bump__x__old__fields us_split_fields2))
  (forall ((x__attr__tag1 Int))
  (! (=> (bump__specific_post us_tag2 unit2__bump__x__fields x__attr__tag1
     unit2__bump__x__old__fields)
     (let ((temp___x_274 (of_base1
                         (to_base
                         (us_repqtmk1 unit2__bump__x__old__fields
                         x__attr__tag1)))))
     (let ((temp___x_2741 (of_base1
                          (to_base
                          (us_repqtmk1 unit2__bump__x__fields x__attr__tag1)))))
     (and
     (and
     (= (to_rep (rec__unit1__t1__c12 (us_split_fields5 temp___x_2741))) (+ 
     (to_rep (rec__unit1__t1__c12 (us_split_fields5 temp___x_274))) 1))
     (= (to_rep (rec__unit2__t2__c21 (us_split_fields5 temp___x_2741))) (+ 
     (to_rep (rec__unit2__t2__c21 (us_split_fields5 temp___x_274))) 1)))
     (= (to_rep (rec__unit3__t3__c3 (us_split_fields5 temp___x_2741))) (+ 
     (to_rep (rec__unit3__t3__c3 (us_split_fields5 temp___x_274))) 1)))))) :pattern ((bump__specific_post
  us_tag2 unit2__bump__x__fields x__attr__tag1
  unit2__bump__x__old__fields)) ))))

;; unit2__t2__compat_axiom
  (assert
  (forall ((unit2__bump__x__fields us_split_fields2)
  (unit2__bump__x__old__fields us_split_fields2))
  (forall ((x__attr__tag1 Int))
  (! (=> (bump__specific_post us_tag1 unit2__bump__x__fields x__attr__tag1
     unit2__bump__x__old__fields)
     (and
     (= (to_rep
        (rec__unit1__t1__c11
        (us_split_fields3 (us_repqtmk1 unit2__bump__x__fields x__attr__tag1)))) (+ 
     (to_rep
     (rec__unit1__t1__c11
     (us_split_fields3
     (us_repqtmk1 unit2__bump__x__old__fields x__attr__tag1)))) 1))
     (= (to_rep
        (rec__unit2__t2__c2
        (us_split_fields3 (us_repqtmk1 unit2__bump__x__fields x__attr__tag1)))) (+ 
     (to_rep
     (rec__unit2__t2__c2
     (us_split_fields3
     (us_repqtmk1 unit2__bump__x__old__fields x__attr__tag1)))) 1)))) :pattern ((bump__specific_post
  us_tag1 unit2__bump__x__fields x__attr__tag1
  unit2__bump__x__old__fields)) ))))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

;; is_max__post_axiom
  (assert true)

;; is_max__post__dispatch_axiom
  (assert true)

;; unit3__t3__compat_axiom
  (assert
  (forall ((x us_rep2))
  (! (=> (is_max__function_guard1 (is_max1 us_tag2 x) us_tag2 x)
     (and (forall ((x1 us_rep2)) (is_max__function_guard (is_max x1) x1))
     (= (ite (is_max x) 1 0) (ite (is_max1 us_tag2 x) 1 0)))) :pattern (
  (is_max1 us_tag2 x)) )))

;; is_max__def_axiom
  (assert
  (forall ((x us_rep2))
  (! (and
     (forall ((x1 us_rep2)) (is_max__function_guard2
     (is_max2 (of_base (to_base1 x1))) (of_base (to_base1 x1))))
     (= (= (is_max x) true)
     (or (= (is_max2 (of_base (to_base1 x))) true)
     (= (to_rep (rec__unit3__t3__c3 (us_split_fields5 x))) 2147483647)))) :pattern (
  (is_max x)) )))

(declare-fun next2 (us_rep2) us_rep2)

(declare-fun next__function_guard2 (us_rep2 us_rep2) Bool)

(declare-fun next3 (Int us_rep2) us_rep2)

(declare-fun next__function_guard3 (us_rep2 Int us_rep2) Bool)

;; unit3__t3__compat_axiom
  (assert
  (forall ((x us_rep2))
  (! (=> (next__function_guard3 (next3 us_tag2 x) us_tag2 x)
     (and (forall ((x1 us_rep2)) (next__function_guard2 (next2 x1) x1))
     (= (next2 x) (next3 us_tag2 x)))) :pattern ((next3 us_tag2 x)) )))

(declare-fun is_max4 (us_rep) Bool)

(declare-fun is_max__function_guard4 (Bool us_rep) Bool)

(declare-fun is_max5 (Int us_rep) Bool)

(declare-fun is_max__function_guard5 (Bool Int us_rep) Bool)

;; is_max__post_axiom
  (assert true)

;; is_max__post__dispatch_axiom
  (assert true)

;; unit3__t3__compat_axiom
  (assert
  (forall ((x us_rep1))
  (! (=> (is_max__function_guard3 (is_max3 us_tag2 x) us_tag2 x)
     (and
     (forall ((x1 us_rep1)) (is_max__function_guard
     (is_max (of_base1 (to_base x1))) (of_base1 (to_base x1))))
     (= (ite (is_max (of_base1 (to_base x))) 1 0) (ite (is_max3 us_tag2 x) 1 0)))) :pattern (
  (is_max3 us_tag2 x)) )))

;; unit2__t2__compat_axiom
  (assert
  (forall ((x us_rep1))
  (! (=> (is_max__function_guard3 (is_max3 us_tag1 x) us_tag1 x)
     (and (forall ((x1 us_rep1)) (is_max__function_guard2 (is_max2 x1) x1))
     (= (ite (is_max2 x) 1 0) (ite (is_max3 us_tag1 x) 1 0)))) :pattern (
  (is_max3 us_tag1 x)) )))

;; is_max__def_axiom
  (assert
  (forall ((x us_rep1))
  (! (and
     (forall ((x1 us_rep1)) (is_max__function_guard4 (is_max4 (to_base x1))
     (to_base x1)))
     (= (= (is_max2 x) true)
     (or (= (is_max4 (to_base x)) true)
     (= (to_rep (rec__unit2__t2__c2 (us_split_fields3 x))) 2147483647)))) :pattern (
  (is_max2 x)) )))

;; unit3__t3__compat_axiom
  (assert
  (forall ((x us_rep1))
  (! (=> (next__function_guard1 (next1 us_tag2 x) us_tag2 x)
     (and
     (forall ((x1 us_rep1)) (next__function_guard2
     (next2 (of_base1 (to_base x1))) (of_base1 (to_base x1))))
     (= (of_base (to_base1 (next2 (of_base1 (to_base x))))) (next1 us_tag2 x)))) :pattern (
  (next1 us_tag2 x)) )))

;; unit2__t2__compat_axiom
  (assert
  (forall ((x us_rep1))
  (! (=> (next__function_guard1 (next1 us_tag1 x) us_tag1 x)
     (and (forall ((x1 us_rep1)) (next__function_guard (next x1) x1))
     (= (next x) (next1 us_tag1 x)))) :pattern ((next1 us_tag1 x)) )))

(define-fun default_initial_assumption2 ((temp___expr_168 us_rep)
  (temp___skip_top_level_169 Bool)) Bool (= (attr__tag temp___expr_168) 
  us_tag))

;; is_max__post_axiom
  (assert true)

;; is_max__post__dispatch_axiom
  (assert true)

;; unit3__t3__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (is_max__function_guard5 (is_max5 us_tag2 x) us_tag2 x)
     (and
     (forall ((x1 us_rep)) (is_max__function_guard (is_max (of_base1 x1))
     (of_base1 x1)))
     (= (ite (is_max (of_base1 x)) 1 0) (ite (is_max5 us_tag2 x) 1 0)))) :pattern (
  (is_max5 us_tag2 x)) )))

;; unit2__t2__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (is_max__function_guard5 (is_max5 us_tag1 x) us_tag1 x)
     (and
     (forall ((x1 us_rep)) (is_max__function_guard2 (is_max2 (of_base x1))
     (of_base x1)))
     (= (ite (is_max2 (of_base x)) 1 0) (ite (is_max5 us_tag1 x) 1 0)))) :pattern (
  (is_max5 us_tag1 x)) )))

;; unit1__t1__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (is_max__function_guard5 (is_max5 us_tag x) us_tag x)
     (and (forall ((x1 us_rep)) (is_max__function_guard4 (is_max4 x1) x1))
     (= (ite (is_max4 x) 1 0) (ite (is_max5 us_tag x) 1 0)))) :pattern (
  (is_max5 us_tag x)) )))

;; is_max__def_axiom
  (assert
  (forall ((x us_rep))
  (! (= (= (is_max4 x) true)
     (= (to_rep (rec__unit1__t1__c1 (us_split_fields1 x))) 2147483647)) :pattern (
  (is_max4 x)) )))

(assert
;; defqtvc
 ;; File "unit3.ads", line 23, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields4))
  (=>
  (forall ((x__split_fields1 us_split_fields4)) (is_max__function_guard
  (is_max (us_repqtmk2 x__split_fields1 x__attr__tag))
  (us_repqtmk2 x__split_fields1 x__attr__tag)))
  (=> (not (= (is_max (us_repqtmk2 x__split_fields x__attr__tag)) true))
  (let ((unit2__bump__x__compl (of_base
                               (to_base1
                               (us_repqtmk2 x__split_fields x__attr__tag)))))
  (forall ((unit2__bump__x__fields us_split_fields2))
  (=>
  (and
  (= (to_rep (rec__unit1__t1__c11 unit2__bump__x__fields)) (+ (to_rep
                                                              (rec__unit1__t1__c11
                                                              (us_split_fields3
                                                              unit2__bump__x__compl))) 1))
  (= (to_rep (rec__unit2__t2__c2 unit2__bump__x__fields)) (+ (to_rep
                                                             (rec__unit2__t2__c2
                                                             (us_split_fields3
                                                             unit2__bump__x__compl))) 1)))
  (forall ((x__split_fields1 us_split_fields4))
  (=>
  (= x__split_fields1 (us_split_fields5
                      (of_base1
                      (to_base
                      (us_repqtmk1 unit2__bump__x__fields
                      (attr__tag1 unit2__bump__x__compl))))))
  (forall ((o Int))
  (=> (= (to_rep (rec__unit3__t3__c3 x__split_fields1)) o)
  (let ((o1 (+ o 1)))
  (=> (in_range o1)
  (forall ((o2 integer))
  (=> (= (to_rep o2) o1)
  (forall ((x__split_fields2 us_split_fields4))
  (=>
  (= x__split_fields2 (us_split_fieldsqtmk2 o2
                      (rec__unit1__t1__c12 x__split_fields1)
                      (rec__unit2__t2__c21 x__split_fields1)
                      (rec__ext__2 x__split_fields1)))
  (in_range (+ (to_rep (rec__unit1__t1__c12 x__split_fields)) 1))))))))))))))))))))
(check-sat)
(exit)
