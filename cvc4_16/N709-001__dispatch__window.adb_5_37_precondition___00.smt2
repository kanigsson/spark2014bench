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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

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
  (rec__object__t__area integer)(rec__object__t__max_width integer)(rec__object__t__max_height integer)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__object__t__area__projection ((a us_split_fields)) integer 
  (rec__object__t__area a))

(define-fun us_split_fields_rec__object__t__max_width__projection ((a us_split_fields)) integer 
  (rec__object__t__max_width a))

(define-fun us_split_fields_rec__object__t__max_height__projection ((a us_split_fields)) integer 
  (rec__object__t__max_height a))

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
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__object__t__area (us_split_fields1 a))) 
                        (to_rep (rec__object__t__area (us_split_fields1 b))))
                        (= (to_rep
                           (rec__object__t__max_width (us_split_fields1 a))) 
                        (to_rep
                        (rec__object__t__max_width (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__object__t__max_height (us_split_fields1 a))) 
                        (to_rep
                        (rec__object__t__max_height (us_split_fields1 b)))))
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

(declare-const object__t__area__first__bit Int)

(declare-const object__t__area__last__bit Int)

(declare-const object__t__area__position Int)

;; object__t__area__first__bit_axiom
  (assert (<= 0 object__t__area__first__bit))

;; object__t__area__last__bit_axiom
  (assert (< object__t__area__first__bit object__t__area__last__bit))

;; object__t__area__position_axiom
  (assert (<= 0 object__t__area__position))

(declare-const object__t__max_width__first__bit Int)

(declare-const object__t__max_width__last__bit Int)

(declare-const object__t__max_width__position Int)

;; object__t__max_width__first__bit_axiom
  (assert (<= 0 object__t__max_width__first__bit))

;; object__t__max_width__last__bit_axiom
  (assert
  (< object__t__max_width__first__bit object__t__max_width__last__bit))

;; object__t__max_width__position_axiom
  (assert (<= 0 object__t__max_width__position))

(declare-const object__t__max_height__first__bit Int)

(declare-const object__t__max_height__last__bit Int)

(declare-const object__t__max_height__position Int)

;; object__t__max_height__first__bit_axiom
  (assert (<= 0 object__t__max_height__first__bit))

;; object__t__max_height__last__bit_axiom
  (assert
  (< object__t__max_height__first__bit object__t__max_height__last__bit))

;; object__t__max_height__position_axiom
  (assert (<= 0 object__t__max_height__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const obj us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun has_stored_area (us_rep) Bool)

(declare-fun has_stored_area__function_guard (Bool us_rep) Bool)

(declare-fun has_stored_area1 (Int us_rep) Bool)

(declare-fun has_stored_area__function_guard1 (Bool Int us_rep) Bool)

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(define-fun default_initial_assumption ((temp___expr_161 us_rep)
  (temp___skip_top_level_162 Bool)) Bool (and
                                         (= (attr__tag temp___expr_161) 
                                         us_tag)
                                         (and
                                         (and
                                         (= (to_rep
                                            (rec__object__t__area
                                            (us_split_fields1
                                            temp___expr_161))) (- 1))
                                         (= (to_rep
                                            (rec__object__t__max_width
                                            (us_split_fields1
                                            temp___expr_161))) (- 1)))
                                         (= (to_rep
                                            (rec__object__t__max_height
                                            (us_split_fields1
                                            temp___expr_161))) (- 1)))))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__object__t__area1 integer)(rec__object__t__max_width1 integer)(rec__object__t__max_height1 integer)(rec__rectangle__t__width natural)(rec__rectangle__t__height natural)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__object__t__area__2__projection ((a us_split_fields2)) integer 
  (rec__object__t__area1 a))

(define-fun us_split_fields_rec__object__t__max_width__2__projection ((a us_split_fields2)) integer 
  (rec__object__t__max_width1 a))

(define-fun us_split_fields_rec__object__t__max_height__2__projection ((a us_split_fields2)) integer 
  (rec__object__t__max_height1 a))

(define-fun us_split_fields_rec__rectangle__t__width__projection ((a us_split_fields2)) natural 
  (rec__rectangle__t__width a))

(define-fun us_split_fields_rec__rectangle__t__height__projection ((a us_split_fields2)) natural 
  (rec__rectangle__t__height a))

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

(declare-fun hide_ext__ (natural natural us_private) us_private)

(declare-fun extract__rectangle__t__width (us_private) natural)

;; extract__rectangle__t__width__conv
  (assert
  (forall ((rectangle__t__width natural) (rectangle__t__height natural))
  (forall ((rec__ext__2 us_private))
  (= (extract__rectangle__t__width
     (hide_ext__ rectangle__t__width rectangle__t__height rec__ext__2)) rectangle__t__width))))

(declare-fun extract__rectangle__t__height (us_private) natural)

;; extract__rectangle__t__height__conv
  (assert
  (forall ((rectangle__t__width natural) (rectangle__t__height natural))
  (forall ((rec__ext__2 us_private))
  (= (extract__rectangle__t__height
     (hide_ext__ rectangle__t__width rectangle__t__height rec__ext__2)) rectangle__t__height))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__object__t__area1
                                         (us_split_fields3 a))
                                         (rec__object__t__max_width1
                                         (us_split_fields3 a))
                                         (rec__object__t__max_height1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__rectangle__t__width
                                         (us_split_fields3 a))
                                         (rec__rectangle__t__height
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (rec__object__t__area
                                         (us_split_fields1 r))
                                         (rec__object__t__max_width
                                         (us_split_fields1 r))
                                         (rec__object__t__max_height
                                         (us_split_fields1 r))
                                         (extract__rectangle__t__width
                                         (rec__ext__ (us_split_fields1 r)))
                                         (extract__rectangle__t__height
                                         (rec__ext__ (us_split_fields1 r)))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep
                            (rec__object__t__area1 (us_split_fields3 a))) 
                         (to_rep
                         (rec__object__t__area1 (us_split_fields3 b))))
                         (= (to_rep
                            (rec__object__t__max_width1 (us_split_fields3 a))) 
                         (to_rep
                         (rec__object__t__max_width1 (us_split_fields3 b)))))
                         (and
                         (and
                         (= (to_rep
                            (rec__object__t__max_height1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__object__t__max_height1
                                                   (us_split_fields3 b))))
                         (= (to_rep1
                            (rec__rectangle__t__width (us_split_fields3 a))) 
                         (to_rep1
                         (rec__rectangle__t__width (us_split_fields3 b)))))
                         (= (to_rep1
                            (rec__rectangle__t__height (us_split_fields3 a))) 
                         (to_rep1
                         (rec__rectangle__t__height (us_split_fields3 b))))))
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

(declare-const object__t__area__first__bit1 Int)

(declare-const object__t__area__last__bit1 Int)

(declare-const object__t__area__position1 Int)

;; object__t__area__first__bit_axiom
  (assert (<= 0 object__t__area__first__bit1))

;; object__t__area__last__bit_axiom
  (assert (< object__t__area__first__bit1 object__t__area__last__bit1))

;; object__t__area__position_axiom
  (assert (<= 0 object__t__area__position1))

(declare-const object__t__max_width__first__bit1 Int)

(declare-const object__t__max_width__last__bit1 Int)

(declare-const object__t__max_width__position1 Int)

;; object__t__max_width__first__bit_axiom
  (assert (<= 0 object__t__max_width__first__bit1))

;; object__t__max_width__last__bit_axiom
  (assert
  (< object__t__max_width__first__bit1 object__t__max_width__last__bit1))

;; object__t__max_width__position_axiom
  (assert (<= 0 object__t__max_width__position1))

(declare-const object__t__max_height__first__bit1 Int)

(declare-const object__t__max_height__last__bit1 Int)

(declare-const object__t__max_height__position1 Int)

;; object__t__max_height__first__bit_axiom
  (assert (<= 0 object__t__max_height__first__bit1))

;; object__t__max_height__last__bit_axiom
  (assert
  (< object__t__max_height__first__bit1 object__t__max_height__last__bit1))

;; object__t__max_height__position_axiom
  (assert (<= 0 object__t__max_height__position1))

(declare-const rectangle__t__width__first__bit Int)

(declare-const rectangle__t__width__last__bit Int)

(declare-const rectangle__t__width__position Int)

;; rectangle__t__width__first__bit_axiom
  (assert (<= 0 rectangle__t__width__first__bit))

;; rectangle__t__width__last__bit_axiom
  (assert (< rectangle__t__width__first__bit rectangle__t__width__last__bit))

;; rectangle__t__width__position_axiom
  (assert (<= 0 rectangle__t__width__position))

(declare-const rectangle__t__height__first__bit Int)

(declare-const rectangle__t__height__last__bit Int)

(declare-const rectangle__t__height__position Int)

;; rectangle__t__height__first__bit_axiom
  (assert (<= 0 rectangle__t__height__first__bit))

;; rectangle__t__height__last__bit_axiom
  (assert
  (< rectangle__t__height__first__bit rectangle__t__height__last__bit))

;; rectangle__t__height__position_axiom
  (assert (<= 0 rectangle__t__height__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 us_rep1)))))
(define-fun t__ref_t__content__2__projection ((a t__ref1)) us_rep1 (t__content1
                                                                   a))

;; has_stored_area__post_axiom
  (assert true)

;; has_stored_area__post__dispatch_axiom
  (assert true)

;; object__t__compat_axiom
  (assert
  (forall ((obj1 us_rep))
  (! (=> (has_stored_area__function_guard1 (has_stored_area1 us_tag obj1)
     us_tag obj1)
     (and
     (forall ((obj2 us_rep)) (has_stored_area__function_guard
     (has_stored_area obj2) obj2))
     (= (ite (has_stored_area obj1) 1 0) (ite (has_stored_area1 us_tag obj1) 1 0)))) :pattern (
  (has_stored_area1 us_tag obj1)) )))

;; rectangle__t__compat_axiom
  (assert
  (forall ((obj1 us_rep))
  (! (=> (has_stored_area__function_guard1 (has_stored_area1 us_tag1 obj1)
     us_tag1 obj1)
     (and
     (forall ((obj2 us_rep)) (has_stored_area__function_guard
     (has_stored_area obj2) obj2))
     (= (ite (has_stored_area obj1) 1 0) (ite (has_stored_area1 us_tag1 obj1) 1 0)))) :pattern (
  (has_stored_area1 us_tag1 obj1)) )))

;; has_stored_area__def_axiom
  (assert
  (forall ((obj1 us_rep))
  (! (= (= (has_stored_area obj1) true) (in_range1
     (to_rep (rec__object__t__area (us_split_fields1 obj1))))) :pattern (
  (has_stored_area obj1)) )))

(declare-fun get_stored_area (us_rep) Int)

(declare-fun get_stored_area__function_guard (Int us_rep) Bool)

(declare-fun get_stored_area1 (Int us_rep) Int)

(declare-fun get_stored_area__function_guard1 (Int Int us_rep) Bool)

;; get_stored_area__post_axiom
  (assert
  (forall ((obj1 us_rep))
  (! (and
     (forall ((obj2 us_rep)) (has_stored_area__function_guard
     (has_stored_area obj2) obj2))
     (=> (= (has_stored_area obj1) true)
     (let ((result (get_stored_area obj1)))
     (=> (get_stored_area__function_guard result obj1) (dynamic_invariant
     result true false true true))))) :pattern ((get_stored_area obj1)) )))

;; get_stored_area__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((obj1 us_rep))
  (! (and
     (forall ((obj2 us_rep)) (has_stored_area__function_guard1
     (has_stored_area1 (attr__tag obj2) obj2) (attr__tag obj2) obj2))
     (=> (= (has_stored_area1 (attr__tag obj1) obj1) true)
     (let ((result (get_stored_area1 attr__tag2 obj1)))
     (=> (get_stored_area__function_guard1 result attr__tag2 obj1)
     (dynamic_invariant result true false true true))))) :pattern ((get_stored_area1
                                                                   attr__tag2
                                                                   obj1)) ))))

;; object__t__compat_axiom
  (assert
  (forall ((obj1 us_rep))
  (! (=> (get_stored_area__function_guard1 (get_stored_area1 us_tag obj1)
     us_tag obj1)
     (and
     (forall ((obj2 us_rep)) (get_stored_area__function_guard
     (get_stored_area obj2) obj2))
     (= (get_stored_area obj1) (get_stored_area1 us_tag obj1)))) :pattern (
  (get_stored_area1 us_tag obj1)) )))

;; rectangle__t__compat_axiom
  (assert
  (forall ((obj1 us_rep))
  (! (=> (get_stored_area__function_guard1 (get_stored_area1 us_tag1 obj1)
     us_tag1 obj1)
     (and
     (forall ((obj2 us_rep)) (get_stored_area__function_guard
     (get_stored_area obj2) obj2))
     (= (get_stored_area obj1) (get_stored_area1 us_tag1 obj1)))) :pattern (
  (get_stored_area1 us_tag1 obj1)) )))

;; get_stored_area__def_axiom
  (assert
  (forall ((obj1 us_rep))
  (! (= (get_stored_area obj1) (to_rep
                               (rec__object__t__area (us_split_fields1 obj1)))) :pattern (
  (get_stored_area obj1)) )))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun default_initial_assumption1 ((temp___expr_205 us_rep1)
  (temp___skip_top_level_206 Bool)) Bool (and
                                         (= (attr__tag1 temp___expr_205) 
                                         us_tag1)
                                         (and
                                         (and
                                         (= (to_rep
                                            (rec__object__t__area1
                                            (us_split_fields3
                                            temp___expr_205))) (- 1))
                                         (= (to_rep
                                            (rec__object__t__max_width1
                                            (us_split_fields3
                                            temp___expr_205))) (- 1)))
                                         (= (to_rep
                                            (rec__object__t__max_height1
                                            (us_split_fields3
                                            temp___expr_205))) (- 1)))))

(assert
;; defqtvc
 ;; File "window.ads", line 8, characters 0-0
  (not
  (forall ((total_area Int))
  (=> (dynamic_invariant total_area true false true true)
  (=> (has_stored_area__function_guard1
  (has_stored_area1 (attr__tag obj) obj) (attr__tag obj) obj)
  (=> (= (has_stored_area1 (attr__tag obj) obj) true)
  (let ((o obj))
  (=>
  (forall ((o1 us_rep)) (has_stored_area__function_guard1
  (has_stored_area1 (attr__tag o1) o1) (attr__tag o1) o1))
  (= (has_stored_area1 (attr__tag o) o) true)))))))))
(check-sat)
(exit)
