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

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-fun invariant__ (us_t) Bool)

(declare-fun invariant____function_guard (Bool us_t) Bool)

(define-fun dynamic_invariant ((temp___expr_222 us_t)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (not (= temp___skip_constant_219 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_222)
                                     (last1 temp___expr_222))))

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (invariant__ a) true) (and (= (first1 a) 1) (<= 0 (last1 a)))) :pattern (
  (invariant__ a)) )))

(declare-fun remove (us_t Int) us_t)

(declare-fun remove__function_guard (us_t us_t Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= 1 100)) (in_range3 temp___expr_215)))

;; remove__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((i Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (=>
     (and
     (and (dynamic_invariant a true true true true) (dynamic_invariant1 i
     true true true true))
     (and (= (invariant__ a) true) (and (<= (first1 a) i) (<= i (last1 a)))))
     (let ((result (remove a i)))
     (and
     (forall ((result1 us_t)) (invariant____function_guard
     (invariant__ result1) result1))
     (=> (remove__function_guard result a i)
     (and
     (and
     (and
     (and
     (and (= (invariant__ result) true) (= (last1 result) (- (last1 a) 1)))
     (forall ((k Int))
     (=> (and (<= 1 k) (<= k (- i 1)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) k))))))
     (forall ((k Int))
     (=> (and (<= (+ i 1) k) (<= k (last1 a)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) (- k 1)))))))
     (forall ((k Int))
     (=> (and (<= i k) (<= k (- (last1 a) 1)))
     (= (to_rep (select (to_array a) (+ k 1))) (to_rep
                                               (select (to_array result) k))))))
     (dynamic_invariant result true false true true))))))) :pattern (
  (remove a i)) ))))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const a1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const a2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const a12 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const a21 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; a1__def_axiom
  (assert
  (and (remove__function_guard (remove a i1) a i1) (= a1 (remove a i1))))

;; a2__def_axiom
  (assert
  (and (remove__function_guard (remove a i2) a i2) (= a2 (remove a i2))))

;; a12__def_axiom
  (assert
  (and (remove__function_guard (remove a i1) a i1)
  (and (remove__function_guard (remove a i1) a i1)
  (and (remove__function_guard (remove (remove a i1) (- i2 1)) (remove a i1)
  (- i2 1)) (= a12 (remove (remove a i1) (- i2 1)))))))

;; a21__def_axiom
  (assert
  (and (remove__function_guard (remove a i2) a i2)
  (and (remove__function_guard (remove a i2) a i2)
  (and (remove__function_guard (remove (remove a i2) i1) (remove a i2) 
  i1) (= a21 (remove (remove a i2) i1))))))

(assert
;; defqtvc
 ;; File "perm.ads", line 17, characters 0-0
  (not
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant1 i1 true false true true)
  (=> (dynamic_invariant1 i2 true false true true)
  (=> (invariant____function_guard (invariant__ a) a)
  (=> (= (invariant__ a) true)
  (=> (<= (first1 a) i1)
  (=> (<= i1 (last1 a))
  (=> (<= (first1 a) i2)
  (=> (<= i2 (last1 a))
  (=> (< i1 i2)
  (let ((o i1))
  (let ((o1 a))
  (let ((perm__remove_swap__a1__assume (remove o1 o)))
  (=>
  (forall ((perm__remove_swap__a1__assume1 us_t))
  (invariant____function_guard (invariant__ perm__remove_swap__a1__assume1)
  perm__remove_swap__a1__assume1))
  (=>
  (and (remove__function_guard perm__remove_swap__a1__assume o1 o)
  (and (dynamic_invariant perm__remove_swap__a1__assume true false true true)
  (and
  (and
  (and
  (and (= (invariant__ perm__remove_swap__a1__assume) true)
  (= (last1 perm__remove_swap__a1__assume) (- (last1 o1) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o 1)))
  (= (to_rep (select (to_array o1) k)) (to_rep
                                       (select (to_array
                                               perm__remove_swap__a1__assume) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o 1) k) (<= k (last1 o1)))
  (= (to_rep (select (to_array o1) k)) (to_rep
                                       (select (to_array
                                               perm__remove_swap__a1__assume) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o k) (<= k (- (last1 o1) 1)))
  (= (to_rep (select (to_array o1) (+ k 1))) (to_rep
                                             (select (to_array
                                                     perm__remove_swap__a1__assume) k))))))))
  (=> (= perm__remove_swap__a1__assume a1)
  (=> (dynamic_invariant a1 true false true true)
  (let ((o2 i2))
  (let ((o3 a))
  (let ((perm__remove_swap__a2__assume (remove o3 o2)))
  (=>
  (forall ((perm__remove_swap__a2__assume1 us_t))
  (invariant____function_guard (invariant__ perm__remove_swap__a2__assume1)
  perm__remove_swap__a2__assume1))
  (=>
  (and (remove__function_guard perm__remove_swap__a2__assume o3 o2)
  (and (dynamic_invariant perm__remove_swap__a2__assume true false true true)
  (and
  (and
  (and
  (and (= (invariant__ perm__remove_swap__a2__assume) true)
  (= (last1 perm__remove_swap__a2__assume) (- (last1 o3) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o2 1)))
  (= (to_rep (select (to_array o3) k)) (to_rep
                                       (select (to_array
                                               perm__remove_swap__a2__assume) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o2 1) k) (<= k (last1 o3)))
  (= (to_rep (select (to_array o3) k)) (to_rep
                                       (select (to_array
                                               perm__remove_swap__a2__assume) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o2 k) (<= k (- (last1 o3) 1)))
  (= (to_rep (select (to_array o3) (+ k 1))) (to_rep
                                             (select (to_array
                                                     perm__remove_swap__a2__assume) k))))))))
  (=> (= perm__remove_swap__a2__assume a2)
  (=> (dynamic_invariant a2 true false true true)
  (let ((o4 (- i2 1)))
  (=> (in_range3 o4)
  (let ((o5 i1))
  (let ((o6 a))
  (let ((o7 (remove o6 o5)))
  (=> (forall ((o8 us_t)) (invariant____function_guard (invariant__ o8) o8))
  (=>
  (and (remove__function_guard o7 o6 o5)
  (and (dynamic_invariant o7 true false true true)
  (and
  (and
  (and (and (= (invariant__ o7) true) (= (last1 o7) (- (last1 o6) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o5 1)))
  (= (to_rep (select (to_array o6) k)) (to_rep (select (to_array o7) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o5 1) k) (<= k (last1 o6)))
  (= (to_rep (select (to_array o6) k)) (to_rep
                                       (select (to_array o7) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o5 k) (<= k (- (last1 o6) 1)))
  (= (to_rep (select (to_array o6) (+ k 1))) (to_rep
                                             (select (to_array o7) k))))))))
  (let ((perm__remove_swap__a12__assume (remove o7 o4)))
  (=>
  (forall ((perm__remove_swap__a12__assume1 us_t))
  (invariant____function_guard (invariant__ perm__remove_swap__a12__assume1)
  perm__remove_swap__a12__assume1))
  (=>
  (and (remove__function_guard perm__remove_swap__a12__assume o7 o4)
  (and (dynamic_invariant perm__remove_swap__a12__assume true false true
  true)
  (and
  (and
  (and
  (and (= (invariant__ perm__remove_swap__a12__assume) true)
  (= (last1 perm__remove_swap__a12__assume) (- (last1 o7) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o4 1)))
  (= (to_rep (select (to_array o7) k)) (to_rep
                                       (select (to_array
                                               perm__remove_swap__a12__assume) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o4 1) k) (<= k (last1 o7)))
  (= (to_rep (select (to_array o7) k)) (to_rep
                                       (select (to_array
                                               perm__remove_swap__a12__assume) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o4 k) (<= k (- (last1 o7) 1)))
  (= (to_rep (select (to_array o7) (+ k 1))) (to_rep
                                             (select (to_array
                                                     perm__remove_swap__a12__assume) k))))))))
  (=> (= perm__remove_swap__a12__assume a12)
  (=> (dynamic_invariant a12 true false true true)
  (let ((o8 i1))
  (let ((o9 i2))
  (let ((o10 a))
  (let ((o11 (remove o10 o9)))
  (=>
  (forall ((o12 us_t)) (invariant____function_guard (invariant__ o12) o12))
  (=>
  (and (remove__function_guard o11 o10 o9)
  (and (dynamic_invariant o11 true false true true)
  (and
  (and
  (and (and (= (invariant__ o11) true) (= (last1 o11) (- (last1 o10) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o9 1)))
  (= (to_rep (select (to_array o10) k)) (to_rep (select (to_array o11) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o9 1) k) (<= k (last1 o10)))
  (= (to_rep (select (to_array o10) k)) (to_rep
                                        (select (to_array o11) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o9 k) (<= k (- (last1 o10) 1)))
  (= (to_rep (select (to_array o10) (+ k 1))) (to_rep
                                              (select (to_array o11) k))))))))
  (let ((perm__remove_swap__a21__assume (remove o11 o8)))
  (=>
  (forall ((perm__remove_swap__a21__assume1 us_t))
  (invariant____function_guard (invariant__ perm__remove_swap__a21__assume1)
  perm__remove_swap__a21__assume1))
  (=>
  (and (remove__function_guard perm__remove_swap__a21__assume o11 o8)
  (and (dynamic_invariant perm__remove_swap__a21__assume true false true
  true)
  (and
  (and
  (and
  (and (= (invariant__ perm__remove_swap__a21__assume) true)
  (= (last1 perm__remove_swap__a21__assume) (- (last1 o11) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o8 1)))
  (= (to_rep (select (to_array o11) k)) (to_rep
                                        (select (to_array
                                                perm__remove_swap__a21__assume) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o8 1) k) (<= k (last1 o11)))
  (= (to_rep (select (to_array o11) k)) (to_rep
                                        (select (to_array
                                                perm__remove_swap__a21__assume) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o8 k) (<= k (- (last1 o11) 1)))
  (= (to_rep (select (to_array o11) (+ k 1))) (to_rep
                                              (select (to_array
                                                      perm__remove_swap__a21__assume) k))))))))
  (=> (= perm__remove_swap__a21__assume a21)
  (=> (dynamic_invariant a21 true false true true)
  (forall ((usf Int))
  (=>
  (= (and (ite (<= (first1 a12) usf) true false) (ite (<= usf (last1 a12))
                                                 true false)) true)
  (=> (< usf i1) (<= usf (last1 a))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
