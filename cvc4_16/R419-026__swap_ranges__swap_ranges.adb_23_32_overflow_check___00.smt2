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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t))
  (and (<= (- 2147483648) (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t t) Bool)

(declare-const dummy2 t)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun to_rep1 ((x t)) Int (tqtint x))

(declare-fun of_rep1 (Int) t)

;; inversion_axiom
  (assert
  (forall ((x t)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x t)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int t))))))
(declare-fun slide ((Array Int t) Int Int) (Array Int t))

;; slide_eq
  (assert
  (forall ((a (Array Int t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int t)) (a__first Int) (a__last Int)
  (b (Array Int t)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int t)) (b (Array Int t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b__first integer)

(declare-const b__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(define-fun dynamic_invariant1 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_159)))

(declare-sort t1 0)

(declare-fun first (t1) integer)

(declare-fun last (t1) integer)

(declare-fun mk (Int Int) t1)

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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int t))(rt t1)))))
(define-fun to_array ((a us_t)) (Array Int t) (elts a))

(define-fun of_array ((a (Array Int t)) (f Int)
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

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((t_arr__ref 0))
(((t_arr__refqtmk (t_arr__content us_t)))))
(define-fun t_arr__ref_t_arr__content__projection ((a t_arr__ref)) us_t 
  (t_arr__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content integer)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) integer 
  (t3b__content a))

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content us_t)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_t 
  (t10b__content a))

(declare-datatypes ((t13b__ref 0))
(((t13b__refqtmk (t13b__content us_t)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_t 
  (t13b__content a))

(declare-datatypes ((t20b__ref 0))
(((t20b__refqtmk (t20b__content us_t)))))
(define-fun t20b__ref_t20b__content__projection ((a t20b__ref)) us_t 
  (t20b__content a))

(declare-datatypes ((t23b__ref 0))
(((t23b__refqtmk (t23b__content us_t)))))
(define-fun t23b__ref_t23b__content__projection ((a t23b__ref)) us_t 
  (t23b__content a))

(declare-datatypes ((t30b__ref 0))
(((t30b__refqtmk (t30b__content us_t)))))
(define-fun t30b__ref_t30b__content__projection ((a t30b__ref)) us_t 
  (t30b__content a))

(declare-datatypes ((t33b__ref 0))
(((t33b__refqtmk (t33b__content us_t)))))
(define-fun t33b__ref_t33b__content__projection ((a t33b__ref)) us_t 
  (t33b__content a))

(declare-datatypes ((t40b__ref 0))
(((t40b__refqtmk (t40b__content us_t)))))
(define-fun t40b__ref_t40b__content__projection ((a t40b__ref)) us_t 
  (t40b__content a))

(declare-datatypes ((t43b__ref 0))
(((t43b__refqtmk (t43b__content us_t)))))
(define-fun t43b__ref_t43b__content__projection ((a t43b__ref)) us_t 
  (t43b__content a))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_166 us_t)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (not (= temp___skip_constant_163 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_166)
                                     (last1 temp___expr_166))))

(assert
;; defqtvc
 ;; File "swap_ranges.ads", line 6, characters 0-0
  (not
  (forall ((a (Array Int t)) (b (Array Int t)) (temp Int) (k Int) (l Int)
  (o Int) (o1 Int))
  (=> (dynamic_property 1 2147483647 (to_rep a__first) (to_rep a__last))
  (=> (dynamic_property 1 2147483647 (to_rep b__first) (to_rep b__last))
  (=>
  (= (length (to_rep a__first) (to_rep a__last)) (length (to_rep b__first)
                                                 (to_rep b__last)))
  (=> (dynamic_invariant1 temp false false true true)
  (=> (dynamic_invariant k false false true true)
  (=> (dynamic_invariant l false false true true)
  (=> (= (to_rep a__last) o)
  (=> (= (to_rep a__first) o1)
  (let ((o2 (length o1 o)))
  (=> (in_range1 o2)
  (forall ((j Int))
  (=> (= j 0)
  (=>
  (= (and (ite (<= 0 j) true false) (ite (<= j (- o2 1)) true false)) true)
  (forall ((temp___loop_entry_248 (Array Int t)))
  (=> (= temp___loop_entry_248 a)
  (forall ((temp___loop_entry_276 (Array Int t)))
  (=> (= temp___loop_entry_276 a)
  (forall ((temp___loop_entry_290 (Array Int t)))
  (=> (= temp___loop_entry_290 b)
  (forall ((temp___loop_entry_262 (Array Int t)))
  (=> (= temp___loop_entry_262 b)
  (forall ((o3 Int))
  (=> (= (to_rep b__first) o3)
  (let ((o4 (+ o3 j)))
  (=> (in_range1 o4)
  (=> (in_range2 o4)
  (forall ((l1 Int))
  (=> (= l1 o4)
  (forall ((o5 Int))
  (=> (= (to_rep a__first) o5)
  (let ((o6 (+ o5 j)))
  (=> (in_range1 o6)
  (=> (in_range2 o6)
  (forall ((k1 Int))
  (=> (= k1 o6)
  (=> (and (<= (to_rep a__first) k1) (<= k1 (to_rep a__last)))
  (forall ((o7 Int))
  (=> (= (to_rep1 (select a k1)) o7)
  (forall ((temp1 Int))
  (=> (= temp1 o7)
  (=> (and (<= (to_rep b__first) l1) (<= l1 (to_rep b__last)))
  (forall ((o8 Int))
  (=> (= (to_rep1 (select b l1)) o8)
  (forall ((o9 t))
  (=> (= (to_rep1 o9) o8)
  (=> (and (<= (to_rep a__first) k1) (<= k1 (to_rep a__last)))
  (forall ((a1 (Array Int t)))
  (=> (= a1 (store a k1 o9))
  (forall ((o10 t))
  (=> (= (to_rep1 o10) temp1)
  (=> (and (<= (to_rep b__first) l1) (<= l1 (to_rep b__last)))
  (forall ((b1 (Array Int t)))
  (=> (= b1 (store b l1 o10))
  (forall ((r8b Int))
  (=> (= r8b l1)
  (=> (dynamic_invariant r8b true false true true)
  (forall ((r11b Int))
  (=> (= r11b k1)
  (=> (dynamic_invariant r11b true false true true)
  (forall ((r18b Int))
  (=> (= r18b k1)
  (=> (dynamic_invariant r18b true false true true)
  (forall ((r21b Int))
  (=> (= r21b l1)
  (=> (dynamic_invariant r21b true false true true)
  (forall ((temp___291 Int))
  (=> (= (to_rep a__first) temp___291)
  (=>
  (=> (<= temp___291 r11b)
  (and
  (and (<= (to_rep a__first) temp___291) (<= temp___291 (to_rep a__last)))
  (and (<= (to_rep a__first) r11b) (<= r11b (to_rep a__last)))))
  (forall ((temp___289 Int))
  (=> (= (to_rep b__first) temp___289)
  (=>
  (=> (<= temp___289 r8b)
  (and
  (and (<= (to_rep b__first) temp___289) (<= temp___289 (to_rep b__last)))
  (and (<= (to_rep b__first) r8b) (<= r8b (to_rep b__last)))))
  (forall ((temp___277 Int))
  (=> (= (to_rep b__first) temp___277)
  (=>
  (=> (<= temp___277 r21b)
  (and
  (and (<= (to_rep b__first) temp___277) (<= temp___277 (to_rep b__last)))
  (and (<= (to_rep b__first) r21b) (<= r21b (to_rep b__last)))))
  (forall ((temp___275 Int))
  (=> (= (to_rep a__first) temp___275)
  (=>
  (=> (<= temp___275 r18b)
  (and
  (and (<= (to_rep a__first) temp___275) (<= temp___275 (to_rep a__last)))
  (and (<= (to_rep a__first) r18b) (<= r18b (to_rep a__last)))))
  (forall ((o11 Int))
  (=> (= (to_rep b__last) o11)
  (=> (< l1 o11) (=> (in_range1 (+ l1 1)) (in_range1 (+ l1 1))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
