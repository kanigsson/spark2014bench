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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 65536))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 65536)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(declare-sort vector_element 0)

(declare-fun vector_elementqtint (vector_element) Int)

;; vector_element'axiom
  (assert
  (forall ((i vector_element))
  (and (<= (- 32768) (vector_elementqtint i))
  (<= (vector_elementqtint i) 32767))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 32768) x) (<= x 32767)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (vector_element vector_element) Bool)

(declare-const dummy3 vector_element)

(declare-datatypes ((vector_element__ref 0))
(((vector_element__refqtmk (vector_element__content vector_element)))))
(declare-fun of_rep (Int) vector_element)

;; inversion_axiom
  (assert
  (forall ((x vector_element))
  (! (= (of_rep (vector_elementqtint x)) x) :pattern ((vector_elementqtint x)) )))

;; range_axiom
  (assert
  (forall ((x vector_element)) (! (in_range4
  (vector_elementqtint x)) :pattern ((vector_elementqtint x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (vector_elementqtint (of_rep x)) x)) :pattern (
  (vector_elementqtint (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int vector_element))))))
(declare-fun slide ((Array Int vector_element) Int
  Int) (Array Int vector_element))

;; slide_eq
  (assert
  (forall ((a (Array Int vector_element)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int vector_element)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int vector_element)) (af Int) (al Int)
  (b (Array Int vector_element)) (bf Int)
  (bl Int)) Bool (ite (and (ite (<= af al) (= (- al af) (- bl bf)) (< bl bf))
                      (forall ((idx Int))
                      (=> (and (<= af idx) (<= idx al))
                      (= (select a idx) (select b (+ (- bf af) idx))))))
                 true false))

(declare-fun compare ((Array Int vector_element) Int Int
  (Array Int vector_element) Int Int) Int)

;; compare_def_eq
  (assert
  (forall ((a (Array Int vector_element)) (b (Array Int vector_element)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (! (= (= (compare a a_first a_last b b_first b_last) 0)
     (= (bool_eq a a_first a_last b b_first b_last) true)) :pattern (
  (compare a a_first a_last b b_first b_last)) ))))

;; compare_def_lt
  (assert
  (forall ((a (Array Int vector_element)) (b (Array Int vector_element)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (! (= (< (compare a a_first a_last b b_first b_last) 0)
     (exists ((i Int) (j Int))
     (and (<= i a_last)
     (and (< j b_last)
     (and (= (bool_eq a a_first i b b_first j) true)
     (or (= i a_last)
     (and (< i a_last)
     (< (vector_elementqtint (select a (+ i 1))) (vector_elementqtint
                                                 (select b (+ j 1))))))))))) :pattern (
  (compare a a_first a_last b b_first b_last)) ))))

;; compare_def_gt
  (assert
  (forall ((a (Array Int vector_element)) (b (Array Int vector_element)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (! (= (< 0 (compare a a_first a_last b b_first b_last))
     (exists ((i Int) (j Int))
     (and (<= i b_last)
     (and (< j a_last)
     (and (= (bool_eq a a_first j b b_first i) true)
     (or (= i b_last)
     (and (< i b_last)
     (< (vector_elementqtint (select b (+ i 1))) (vector_elementqtint
                                                 (select a (+ j 1))))))))))) :pattern (
  (compare a a_first a_last b b_first b_last)) ))))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep1 x)) x)) :pattern ((to_rep
                                                             (of_rep1 x))) )))

(define-fun index_dynamic_property ((first Int) (last Int)
  (x Int)) Bool (and (<= first x) (<= x last)))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high)
                   (and (index_dynamic_property range_first range_last low)
                   (index_dynamic_property range_first range_last high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int vector_element))(rt t)))))
(define-fun of_array ((a (Array Int vector_element)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_t)))))
(define-fun usget ((v us_t)
  (i Int)) Int (vector_elementqtint (select (elts v) i)))

(define-fun dynamic_invariant2 ((expr us_t) (us Bool) (skip_bounds Bool)
  (us1 Bool)
  (us2 Bool)) Bool (=> (not (= skip_bounds true)) (dynamic_property 1 65536
                   (first1 expr) (last1 expr))))

(declare-fun of_rep2 (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index))
  (! (= (of_rep2 (indexqtint x)) x) :pattern ((indexqtint x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range3
  (indexqtint x)) :pattern ((indexqtint x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (indexqtint (of_rep2 x)) x)) :pattern ((indexqtint
                                                                 (of_rep2 x))) )))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 65536))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 65536)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (extended_index extended_index) Bool)

(declare-const dummy5 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(declare-fun of_rep3 (Int) extended_index)

;; inversion_axiom
  (assert
  (forall ((x extended_index))
  (! (= (of_rep3 (extended_indexqtint x)) x) :pattern ((extended_indexqtint
                                                       x)) )))

;; range_axiom
  (assert
  (forall ((x extended_index)) (! (in_range5
  (extended_indexqtint x)) :pattern ((extended_indexqtint x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (extended_indexqtint (of_rep3 x)) x)) :pattern (
  (extended_indexqtint (of_rep3 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__sums__slice_bounds__lo index)(rec__sums__slice_bounds__hi extended_index)))))
(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(declare-datatypes ((slice_bounds 0))
(((slice_boundsqtmk (us_split_fields1 us_split_fields)))))
(declare-datatypes ((slice_bounds__ref 0))
(((slice_bounds__refqtmk (slice_bounds__content slice_bounds)))))
(define-fun usrec__lo ((b slice_bounds)) Int (indexqtint
                                             (rec__sums__slice_bounds__lo
                                             (us_split_fields1 b))))

(define-fun usrec__hi ((b slice_bounds)) Int (extended_indexqtint
                                             (rec__sums__slice_bounds__hi
                                             (us_split_fields1 b))))

(define-fun bool_eq2 ((a slice_bounds)
  (b slice_bounds)) Bool (ite (and (= (usrec__lo a) (usrec__lo b))
                              (= (usrec__hi a) (usrec__hi b)))
                         true false))

(declare-const dummy6 slice_bounds)

(declare-const x us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort t1 0)

(declare-fun le (t1 t1) Bool)

(declare-fun lt (t1 t1) Bool)

(declare-fun gt (t1 t1) Bool)

(declare-fun add (t1 t1) t1)

(declare-fun sub (t1 t1) t1)

(declare-const one t1)

(declare-sort component_type 0)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array t1 component_type))))))
(declare-fun slide1 ((Array t1 component_type) t1
  t1) (Array t1 component_type))

;; slide_eq
  (assert
  (forall ((a (Array t1 component_type)))
  (forall ((first2 t1))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array t1 component_type)))
  (forall ((old_first t1))
  (forall ((new_first t1))
  (forall ((i t1))
  (! (= (select (slide1 a old_first new_first) i) (select a (sub i
                                                            (sub new_first
                                                            old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(declare-fun sum__logic (us_t slice_bounds) Int)

;; sum_def
  (assert
  (forall ((v us_t) (b slice_bounds))
  (! (and (in_range1 (sum__logic v b))
     (and (=> (< (usrec__hi b) (usrec__lo b)) (= (sum__logic v b) 0))
     (=>
     (and (<= (first1 v) (usrec__lo b))
     (and (<= (usrec__lo b) (usrec__hi b)) (<= (usrec__hi b) (last1 v))))
     (and
     (=> (= (usrec__lo b) (usrec__hi b))
     (= (sum__logic v b) (usget v (usrec__lo b))))
     (forall ((b1 slice_bounds))
     (! (and
        (=>
        (and (= (usrec__hi b1) (usrec__hi b))
        (and (< (usrec__lo b) (usrec__lo b1))
        (<= (usrec__lo b1) (usrec__hi b))))
        (= (sum__logic v b) (+ (sum__logic v b1) (sum__logic v
                                                 (slice_boundsqtmk
                                                 (us_split_fieldsqtmk
                                                 (rec__sums__slice_bounds__lo
                                                 (us_split_fields1 b))
                                                 (of_rep3
                                                 (- (usrec__lo b1) 1))))))))
        (=>
        (and (= (usrec__lo b1) (usrec__lo b))
        (and (<= (usrec__lo b) (usrec__hi b1))
        (< (usrec__hi b1) (usrec__hi b))))
        (= (sum__logic v b) (+ (sum__logic v b1) (sum__logic v
                                                 (slice_boundsqtmk
                                                 (us_split_fieldsqtmk
                                                 (of_rep2
                                                 (+ (usrec__hi b1) 1))
                                                 (rec__sums__slice_bounds__hi
                                                 (us_split_fields1 b))))))))) :pattern (
     (sum__logic v b1)) )))))) :pattern ((sum__logic v b)) )))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x1 Int)) Bool (and (<= first_int x1) (<= x1 last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy7 integer)

(declare-datatypes ((t26b__ref 0))
(((t26b__refqtmk (t26b__content integer)))))
(define-fun t26b__ref_t26b__content__projection ((a t26b__ref)) integer 
  (t26b__content a))

(declare-const rliteral extended_index)

;; rliteral_axiom
  (assert (= (extended_indexqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "slice_sums.ads", line 16, characters 0-0
  (not
  (forall ((current_lo Int) (max_sum Int) (current_sum Int)
  (spark__branch Bool))
  (=> (dynamic_invariant2 x true false true true)
  (=> (= max_sum 0)
  (=> (dynamic_invariant1 max_sum true false true true)
  (=> (= current_sum 0)
  (=> (dynamic_invariant current_sum true false true true)
  (=> (in_range3 current_lo)
  (=> (= spark__branch (ite (< (last1 x) (first1 x)) true false))
  (=> (not (= spark__branch true))
  (let ((o (first1 x)))
  (=> (in_range3 o)
  (forall ((o1 index))
  (=> (= (indexqtint o1) o)
  (forall ((result____split_fields us_split_fields))
  (=> (= result____split_fields (us_split_fieldsqtmk o1 rliteral))
  (forall ((o2 Int))
  (=>
  (= (indexqtint (rec__sums__slice_bounds__lo result____split_fields)) o2)
  (forall ((current_lo1 Int))
  (=> (= current_lo1 o2)
  (let ((temp___208 (first1 x)))
  (forall ((current_hi Int))
  (=> (= current_hi temp___208)
  (=>
  (= (and (ite (<= temp___208 current_hi) true false) (ite (<= current_hi 
                                                      (last1 x)) true false)) true)
  (=>
  (or
  (not
  (and (and (<= (first1 x) current_lo1) (<= current_lo1 current_hi))
  (<= 0 current_sum)))
  (let ((o3 (- current_hi current_lo1)))
  (and (in_range1 o3) (in_range1 (* o3 32767)))))
  (let ((o3 (- current_hi 1)))
  (=> (in_range1 o3)
  (=> (in_range5 o3)
  (forall ((o4 extended_index))
  (=> (= (extended_indexqtint o4) o3)
  (forall ((o5 index))
  (=> (= (indexqtint o5) current_lo1)
  (=>
  (exists ((o6 Int))
  (and
  (= (extended_indexqtint
     (rec__sums__slice_bounds__hi result____split_fields)) o6)
  (exists ((o7 Int))
  (and
  (= (indexqtint (rec__sums__slice_bounds__lo result____split_fields)) o7)
  (or (not (<= o7 o6))
  (exists ((o8 Bool))
  (exists ((o9 Int))
  (and
  (= (indexqtint (rec__sums__slice_bounds__lo result____split_fields)) o9)
  (ite (<= (first1 x) o9)
  (exists ((o10 Int))
  (and
  (= (extended_indexqtint
     (rec__sums__slice_bounds__hi result____split_fields)) o10)
  (= o8 (ite (<= o10 (last1 x)) true false)))) (= o8 false))))))))))
  (=> (in_range1 (- current_hi 1))
  (forall ((usf Int))
  (let ((o6 (- current_hi 1)))
  (=> (in_range1 o6)
  (=>
  (= (and (ite (<= current_lo1 usf) true false) (ite (<= usf o6) true false)) true)
  (forall ((o7 extended_index))
  (=> (= (extended_indexqtint o7) usf)
  (forall ((o8 index))
  (=> (= (indexqtint o8) current_lo1)
  (let ((o9 (slice_boundsqtmk (us_split_fieldsqtmk o8 o7))))
  (let ((o10 x))
  (or (< (usrec__hi o9) (usrec__lo o9))
  (and (<= (first1 o10) (usrec__lo o9)) (<= (usrec__hi o9) (last1 o10)))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
